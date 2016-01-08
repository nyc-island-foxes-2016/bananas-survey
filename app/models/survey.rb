class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  validates :title, length: {maximum: 50}, presence: true
end
