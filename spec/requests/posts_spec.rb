require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do
  # Test suite for GET /api/posts
  describe 'GET /api/posts' do
    # make HTTP get request before each example
    before { get '/api/posts' }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(response.body).to match("{\"error\":\"Tag parameter is required\"}")
    end

    it 'returns status code 400' do
      expect(response).to have_http_status(400)
    end
  end

  # Test suite for GET /api/posts?tag=tags
  describe 'GET /api/posts?tag=tech' do
    context 'when valid tag is used' do
      before { get "/api/posts?tag=tech" }

      it 'returns posts' do
        expect(json).not_to be_empty
        expect(json['posts'][0]).to eq(tech_tag)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when no tag is entered' do
      before { get '/api/posts?tag=' }

      it 'returns a tags parameter required error' do
        expect(response.body).to match("{\"error\":\"Tag parameter is required\"}")
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when invalid tag is entered' do
      before { get "/api/posts?tag=InvalidTag!" }

      it 'returns an empty response body' do
        expect(response.body).to match("{\"posts\":[]}")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Testing suite for GET /api/posts?tag=tech&sortBy=likes
  describe 'GET /api/posts?tag=tech&sortBy=likes' do
    context 'when valid sortBy parameter is used' do
      before { get "/api/posts?tag=tech&sortBy=likes" }

      it 'returns posts' do
        expect(json).not_to be_empty
        expect(json['posts'][0]).to eq(likes_sortby)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when no sortBy parameter is entered' do
      before { get '/api/posts?tag=tech&sortBy=' }

      it 'returns an invalid sortBy parameter error' do
        expect(json).to match({"error"=>"sortBy parameter is invalid"})
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when invalid sortBy parameter is entered' do
      before { get "/api/posts?tag=tech&sortBy=nil" }

      it 'returns an invalid sortBy parameter error' do
        expect(json).to match({"error"=>"sortBy parameter is invalid"})
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end

  # Testing suite for GET /api/posts?tag=tech&sortBy=sortby&direction=(direction)
  describe 'GET /api/posts?tag=tech&sortBy=likes&direction=(direction)' do
    context 'when valid direction parameter is used' do
      before { get "/api/posts?tag=tech&sortBy=likes&direction=desc" }

      it 'returns posts' do
        expect(json).not_to be_empty
        expect(json['posts'][0]).to eq(descending_direction)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when no direction parameter is specified' do
      before { get '/api/posts?tag=tech&sortBy=likes&direction=' }

      it 'defaults to ascending' do
        expect(json).not_to be_empty
        expect(json['posts'][0]).to eq(ascending_direction)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when invalid direction parameter is entered' do
      before { get "/api/posts?tag=tech&sortBy=likes&direction=nil" }

      it 'returns an invalid direction parameter error' do
        expect(json).to match({"error"=>"direction parameter is invalid"})
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
