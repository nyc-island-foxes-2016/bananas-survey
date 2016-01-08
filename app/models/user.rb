class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_many :surveys

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :password, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.new(new_password)
    self.password_hash = @password
  end

end
