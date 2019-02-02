class Content < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  validates :summary, :content, :author, :title, :published_date, presence: true
  validates :summary, length: { maximum: 50 }
  validates :content, length: { maximum: 250 }
end
