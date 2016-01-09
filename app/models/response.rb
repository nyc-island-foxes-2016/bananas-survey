class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  belongs_to :question
  belongs_to :choice

  #methods to increment like responses

end
