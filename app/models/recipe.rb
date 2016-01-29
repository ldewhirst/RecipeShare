class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy


  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true

  scope :order_by_recently_created, -> { order(created_at: :desc) }
end
