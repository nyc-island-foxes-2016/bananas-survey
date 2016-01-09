get '/questions/:survey_id/new' do
  @question = Question.new
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'questions/new', layout: false
end

post '/questions' do
  if request.xhr?
    @question = Question.create(params[:question])
     redirect "/choices/#{@question.id}/new"
  else
    @question = Question.new(params[:question])
    if @question.save
      redirect "/choices/#{@question.id}/new"
    else
      @errors = @question.errors.full_messages
      redirect "/questions/new"
    end
  end
end
