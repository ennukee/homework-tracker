class User < ActiveRecord::Base
  attr_accessor :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #if I ever add emails
  before_save { self.username = username.downcase }

  has_many :assignments
  validates :username, presence: true, 
                       length: { maximum: 20, minimum: 6 },
                       uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  def index_of_assn_type(assn)
    assignment_types.index(assn)
  end

  def assignments(col="name", dir="asc")
    Assignment.where(user_id: id).order(col + " " + dir)
  end

  def important_assignments
    assignments.order(:due_date).where(important: true)
  end

  def assignments_due_in(i)
    assignments.where("due_date < ?", Time.now + i.days)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
