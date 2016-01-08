class QuestionChoice < ActiveRecord::Base
  has_many :questions
  has_many :choices
end
