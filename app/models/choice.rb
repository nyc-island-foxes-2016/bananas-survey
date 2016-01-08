class Choice < ActiveRecord::Base
  belongs_to :question_choice
  has_many :questions, through: :question_choice

  validates :text, length: {maximum: 50}, presence: true
end
