class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  acts_as_mentioner

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
