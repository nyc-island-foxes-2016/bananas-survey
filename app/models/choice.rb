class Choice < ActiveRecord::Base
  belongs_to: question_choice

  validates :text, length: {maximum: 50}, presence: true
end
