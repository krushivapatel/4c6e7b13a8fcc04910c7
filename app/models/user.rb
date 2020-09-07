class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_auth_token!
  # relationship for followings
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  # relationship for followers
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :tweets, dependent: :destroy
  # function used to generate token for api authentication
  def generate_auth_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  # Follow a user
  def follow!(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollow a user
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # If current user is following other user it'll return true      
  def following?(other_user)
    following.include?(other_user)
  end

  def as_json(options = {})
    super options.merge({except: [:auth_token, :created_at, :updated_at]})
  end

end
