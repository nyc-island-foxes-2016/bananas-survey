class Choice < ActiveRecord::Base
  has_many :question_choices
  has_many :questions, through: :question_choices
  has_many :responses

  validates :text, length: {maximum: 50}, presence: true
end
