get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

post '/surveys/banana' do
  binding.pry
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

  if @survey.save
    @question.survey = @survey
    if @question.save
    (params[:choices]).each do |choice_text|
      choice = Choice.create(text: choice_text)
          QuestionChoice.create(question: @question, choice: choice)
      end
      redirect "/users/#{params[:survey][:user_id]}"
    else
      @question_errors = @question.errors.full_messages
      erb :'/surveys/new'
    end
  else
    @survey_errors = @survey.errors.full_messages
    erb :'/surveys/new'
  end
end




