require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let!(:user) { User.create(email: 'test@mail.ru', password: 'abc123') }
  let!(:news) { News.create(id: 1, title: 'title', content: 'content', user_id: 1) } 
  let!(:user_news) { UserNews.create(user_id: 1, news_id: 1) } 

  describe 'GET /users/:user_id/news' do 
    before { get 'index', params: { user_id: 1 } } 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id/news/:id' do 
    before { get 'show', params: { id: 1, user_id: 1 } } 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users/:user_id/news' do 
    before { post 'create', params: { user_id: 1, news: { title: 'title', content: 'content' } } } 

    it 'returns status code 201' do 
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /users/:user_id/news/:id' do 
    before { put 'update', params: { id: 1, user_id: 1, news: { title: 'updated_title', content: 'updated_content' } } }

    it 'returns status code 204' do 
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /users/:user_id/news/:id' do 
    before { delete 'destroy', params: { id: 1, user_id: 1,  } }

    it 'returns status code 204' do 
      expect(response).to have_http_status(204)
    end
  end
end
