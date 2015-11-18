class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #if I ever add emails
  before_save { self.username = username.downcase }

  has_many :assignments
  validates :username, presence: true, 
                       length: { maximum: 20, minimum: 6 },
                       uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: { minimum: 6 }

  has_secure_password

  def assignments
    Assignments.where(user_id: id)
  end
end
