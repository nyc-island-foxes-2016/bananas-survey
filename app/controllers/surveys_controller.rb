get '/surveys/new' do
  @survey = Survey.new
  @question = Question.new
  @choice = Choice.new
  erb :'surveys/new'
end

# Example Params => {"survey"=>{"user_id"=>"2", "title"=>"ksdfj"}, "question"=>{"text"=>"lskdjf"}, "choices"=>["lll", "hhh"]}

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










