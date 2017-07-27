require 'rails_helper'

RSpec.describe User, type: :model do
  context '#validations check' do 
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    
    subject { User.new(email: 'test@mail.ru', password: 'abc123', token: 'anytokenhere') } 
    it { should validate_uniqueness_of(:token) } 
  end
end
