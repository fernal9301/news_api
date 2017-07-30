require 'rails_helper'

RSpec.describe News, type: :model do
  context '#validations check' do 
    it { should validate_presence_of :title } 
    it { should validate_presence_of :content } 
    it { should have_many(:users).dependent(:destroy) }
  end
end
