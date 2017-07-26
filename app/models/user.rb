#require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, length: { minimum: 2 } 
  validates :password, presence: true, length: { minimum: 6 } 
  validate :set_token

  def set_token
    #self.token = Digest::SHA2.hexdigest(email + password)
    self.token = [*('a'..'z'), *('0'..'9')].sample(32).join
  end
end
