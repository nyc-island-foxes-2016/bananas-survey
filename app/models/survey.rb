class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :responses

  validates :title, length: {maximum: 50}, presence: true
end
