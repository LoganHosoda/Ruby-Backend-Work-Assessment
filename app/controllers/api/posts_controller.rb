module Api
  class PostsController < ApplicationController
    before_action :set_tags, :set_direction, :set_sortby

    require 'rest-client'
    require 'json'

    API_URL = 'https://api.hatchways.io/assessment/blog/posts'

    # GET /posts
    def index
      @posts = fetch_posts
      render json: @posts
    end

    private

    # Fetch data from Hatchways API. Save data if record doesn't exist,
    # Or update database if record 'cache' is expired.
    def fetch_posts
      # Individually apply tags to url
      @post_urls = url_query.each do |url|
        if Post.saved?(url)
          if Post.expired?(url)
            payload = JSON.parse(RestClient.get(url))
            Post.find_by('url': url).update!(url: url, payload: payload, updated_at: Time.now)
          end
        else
          payload = JSON.parse(RestClient.get(url))
          Post.create(url: url, payload: payload)
        end
      end
      # Pull data from database utilizing parameters from the search query
      Post.return_posts(@post_urls, @tags, @sortby, @direction)
    end

    # Add search tag to Hatchways API URL
    def url_query
      @tags = set_tags
      @urls = []
      @tags.each do |tag|
        search = "?tag=#{tag}"
        api_fetch = API_URL + search
        @urls.push(api_fetch)
      end
      @urls
    end

    # Creates tag(s) array
    def set_tags
      if tags_validation?
        @tags = params['tag'].split(',')
      else
        render json: { error: 'Tag parameter is required' },
               status: 400
      end
    end

    # Creates sortBy array
    def set_sortby
      return unless params['sortBy']

      if sort_by_validation?(params['sortBy'])
        @sortby = params['sortBy'].split(',')
      else
        render json: { error: 'sortBy parameter is invalid' },
               status: 400
      end
    end

    # Creates direction array
    def set_direction
      if !params.include?('direction')
        @direction = ['ascending']
      elsif params['direction'] == nil || params['direction'] == ''
        @direction = ['ascending']
      elsif direction_validation?(params['direction'])
        @direction = params['direction'].split
      else
        render json: { error: 'direction parameter is invalid' },
               status: 400
      end
    end

    # Validation for tag parameter
    def tags_validation?
      return unless params.include?('tag')
      return if params['tag'] == nil

      params.include?('tag') && !params['tag'].empty?
    end

    # Validation for sortBy parameter
    def sort_by_validation?(val)
      return if val == nil

      # Acceptable sortBy parameters
      conditions = %w[id reads likes popularity]
      conditions.any? { |cond| val.include?(cond) }
    end

    # Validation for direction parameter
    def direction_validation?(val)
      return unless params.include?('direction')

      # Acceptable direction parameters
      conditions = %w[ascending asc descending desc]
      conditions.any? { |cond| val.include?(cond) }
    end
  end
end
