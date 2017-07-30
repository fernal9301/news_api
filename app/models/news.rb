class News < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  after_create :set_date

  has_many :user_news
  has_many :users, through: :user_news, dependent: :destroy

  def set_date 
    self.date = created_at.to_date
  end

  def self.ordered_news(user_id) 
    User.find(user_id).news.order(date: :desc)
  end
end
