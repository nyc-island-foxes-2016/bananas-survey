class Choice < ActiveRecord::Base
  has_many :question_choices
  has_many :questions, through: :question_choices

  validates :text, length: {maximum: 50}, presence: true
end
