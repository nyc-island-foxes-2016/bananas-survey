get '/questions/:survey_id/new' do
  @question = Question.new
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/choices/new"
  else
    @errors = @question.errors.full_messages
    redirect "/questions/new"
  end
end
