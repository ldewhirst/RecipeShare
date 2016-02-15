class Recipe < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  acts_as_taggable
  acts_as_taggable_on :tags

  # acts_as_likeable

  mount_uploader :image, ImageUploader

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  # validates :image, presence: true
  validates :user, presence: true

  scope :order_by_recently_created, -> { order(created_at: :desc) }


  def self.search(term)
    search_term = "%#{term.downcase}"

    where('title LIKE ?', search_term)
    where('body LIKE ?', search_term)
    where(tagged_with(search_term))
  end
end
