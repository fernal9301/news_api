class News < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  after_create :set_date

  has_many :user_news
  has_many :users, through: :user_news

  def set_date 
    self.date = created_at.to_date
  end

  def ordered_news 
    # User.find(user_id).news.order(date: :desc) - тут новости конкретного юзера
    # тут просто все новости
    News.all.order(date: :desc)
  end
end
