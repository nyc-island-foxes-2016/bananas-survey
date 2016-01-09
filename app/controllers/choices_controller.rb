get '/choices/:id' do
  @question = Question.find_by(id: params[:id])
  @choices = @question.choices
  erb :'/choices/show', layout: false
end

get '/choices/:id/new' do
  @question = Question.find_by(id: params[:id])
  @choice = Choice.new
  erb :'/choices/new', layout: false
end

post '/choices' do
  if request.xhr?
    @choice = Choice.create(text: params[:choice][:text])
    @question = Question.find_by(id: params[:choice][:question_id])
    @choice.questions << @question
    redirect "/choices/#{@question.id}"
  else
    @choice = Choice.new(text: params[:choice][:text])
    @question = Question.find_by(id: params[:choice][:question_id])
    @choice.questions << @question
    if @choice.save
      redirect "/choices/#{@question.id}"
    else
      @choice_errors = @choice.errors.full_messages
      erb :'/choices/new'
    end
  end
end
