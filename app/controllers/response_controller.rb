# post '/response' do
#   @question_choice = QuestionChoice.find_by id: params[:response][:choice_id]
#   @question = Question.find_by id: @question_choice.question_id
#   @choice = Choice.find_by id: @question_choice.choice_id
#   @survey = Survey.find_by(id: params[:response][:survey_id])
#   @user = User.find_by id: session[:user_id]

#   Test = Response.new(user: @user, survey: @survey, question: @question, choice: @choice)
#   binding.pry
# end
