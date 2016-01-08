class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :question_choices
  has_many :choices, through: :question_choices

  validates :text, length: {maximum: 50}, presence: true
end
