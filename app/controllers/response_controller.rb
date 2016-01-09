post '/response' do
  @question_choice = QuestionChoice.find_by id: params[:response][:choice_id]
  @question = Question.find_by id: @question_choice.question_id
  @choice = Choice.find_by id: @question_choice.choice_id
  @survey = Survey.find_by(id: params[:response][:survey_id])
  @user = User.find_by id: session[:user_id]
  @answer = Response.new(user: @user, survey: @survey, question: @question, choice: @choice)
  if @answer.save
    redirect "/surveys"
  else
    @errors = @response.errors.full_messages
    redirect "/surveys/#{@survey.id}"
  end

end

get '/response/:id/stats' do
  @survey = Survey.find_by(id: params[:id])
  @answers = @survey.responses
  erb :'/stats/show'
end

