
get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  @survey = Survey.new
  @question = Question.new
  @choice = Choice.new
  erb :'surveys/new'
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

delete '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey.destroy
  redirect "users/#{session[:user_id]}"
end


post '/surveys' do
  @survey = Survey.new(params[:survey])
  @question = Question.new(params[:question])

  # Iterates through choices entered and creates new Choices and QuestionChoices
  (params[:choices]).each do |choice_text|
      choice = Choice.create(text: choice_text)
      QuestionChoice.create(question: @question, choice: choice )
  end

  if @survey.save
    redirect "/users/#{params[:survey][:user_id]}"
  else
    @errors = @survey.errors.full_messages
    erb :'/surveys/new'
  end

end






