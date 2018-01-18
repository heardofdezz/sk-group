class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
     validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8}, allow_nil: true

  class << self
#Returns the hash (table) digest of the given string(password)
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

# Returns a random token
  def new_token
      SecureRandom.urlsafe_base64
  end
end

  def confirm!
    update!(confirmed_at: DateTime.now)
  end

  def confirmed?
    !! confirmed_at
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #Returns true if the token matches the digest (token /matches password of user)
  def authenticated?(remember_token)
    return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

end
