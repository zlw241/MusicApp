# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true, uniqueness: true

  after_initialize :ensure_session_token

  has_many :comments,
    class_name: "Comment",
    foreign_key: :user_id,
    primary_key: :id

  has_many :comment_likes,
    class_name: "CommentLike",
    foreign_key: :user_id,
    primary_key: :id

  has_many :liked_comments,
    through: :comment_likes,
    source: :comment


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token ||= User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.find_by_credentials(username_or_email, password)
    user = User.find_by(email: username_or_email) || User.find_by(username: username_or_email)
    if user
      return user if BCrypt::Password.new(user.password_digest).is_password?(password)
    else
      nil
    end
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
