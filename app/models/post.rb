class Post < ApplicationRecord
  validates :url, :payload, presence: true

  # Returns posts sorted by provided parameters
  def self.return_posts(url, tags, sortby, direction)
    @bulk_posts = search_url(url)
    @posts = search_posts(@bulk_posts, tags).uniq
    if sortby
      if direction[0] == 'ascending'
        @posts = ascending(@posts, sortby)
      else
        @posts = descending(@posts, sortby)
      end
    end
    { 'posts': @posts }
  end

  # Check if post url is already in database
  def self.saved?(url)
    @urls = []
    Post.all.each do |post|
      @urls.push(post['url'])
    end
    @urls.include?(url)
  end

  # Check how old saved data is. Expired if > 10 minutes
  def self.expired?(url)
    cur_time = Time.now
    expiration = ''
    Post.all.each do |post|
      if post['url'].include?(url)
        expiration = post['updated_at'] + (60 * 10)
      end
    end
    cur_time > expiration
  end

  # Add posts with matching url from database to array
  def self.search_url(url)
    bulk_posts = []
    Post.all.each do |post|
      if url.any? { |i| post['url'].include?(i) }
        bulk_posts.push(post)
      end
    end
    bulk_posts
  end

  # Add posts with matching tags from database to array
  def self.search_posts(posts, tags)
    post_array = []
    posts.each do |post|
      post.payload['posts'].each do |post_data|
        if tags.any? { |tag| post_data['tags'].include?(tag) }
          post_array.push(post_data)
        end
      end
    end
    post_array
  end

  # Sort data in ascending order with given sortBy
  def self.ascending(posts, sortby)
    posts.sort_by! { |post| post[sortby[0]] }
  end

  # Sort data in descending order with given sortBy
  def self.descending(posts, sortby)
    posts.sort_by! { |post| post[sortby[0]] }
    posts.reverse
  end
end
