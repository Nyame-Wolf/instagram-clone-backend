require 'rails_helper'

RSpec.describe CommentRepliesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/comment_replies').to route_to('comment_replies#index')
    end

    it 'routes to #show' do
      expect(get: '/comment_replies/1').to route_to('comment_replies#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/comment_replies').to route_to('comment_replies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/comment_replies/1').to route_to('comment_replies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/comment_replies/1').to route_to('comment_replies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/comment_replies/1').to route_to('comment_replies#destroy', id: '1')
    end
  end
end
