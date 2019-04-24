class User < ApplicationRecord
  has_secure_password

  has_many :punchtimes, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
                   format: /\A\S+@\S+\z/,
                   uniqueness: { case_sensitive: false }

  def self.is_authentic(email, password)
    user = User.find_by(email: email)
    # this will return true or false
    user && user.authenticate(password)
  end
end
