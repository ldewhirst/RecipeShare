class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  has_many :recipes
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe

  acts_as_followable
  acts_as_follower
  acts_as_liker
  acts_as_mentionable

  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }

  enum role: [:member, :admin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_date"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def liked(recipe)
    likes.where(recipe_id: recipe.id).first
  end

end
