require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # Test for POST /users
  describe 'POST /users' do 
    context '#check valid request' do

      before { post 'create', params: { user: { email: 'test@mail.ru', password: 'abc123' } } }

      it 'creates a user' do
        expect(json['email']).to eq('test@mail.ru')
        expect(json['password']).to eq('abc123')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end    

    context '#check invalid request' do

      before { post 'create', params: { user: { email: 'anyemail@mail.ru'} } } 

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end    
  end #<-- end of POST /users 

  # Test for UPDATE /users/:id  
 
  describe 'PUT /users/:id' do  
    let!(:user) { User.create(id: 1, email: 'test@mail.ru', password: 'abc123') }

    context '# check success update' do 
      before { put 'update',  params: { id: 1, user: {  email: 'newmail@ya.ru' } } }

      it 'updates the record' do 
        expect(response.body).to be_empty
      end 

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
      
    end
  end #<-- end of PUT /users/:id

  describe 'DELETE /users/:id' do
    let!(:user) { User.create(id: 1, email: 'test@mail.ru', password: 'abc123', token: 'anytoken') }

    context '# check success delete' do
      before { delete 'destroy',  params: { id: 1, user: { token: 'anytoken' } } } 

      it 'deletes the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

    end
  end #<-- end of DELETE /users/:id

end
