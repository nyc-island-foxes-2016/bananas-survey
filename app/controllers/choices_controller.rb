# get '/choices' do
#   binding.pry
#   @question = Question.find_by id: params[:choice][:question_id]
#   #define the survey we are creating
#   #take the choices from that survey
#   @choices = @question.choices
#   erb :'/choices/show'
# end

get '/choices/:id' do
  # binding.pry
  @question = Question.find_by(id: params[:id])
  @choices = @question.choices
  erb :'/choices/show'
end

get '/choices/:id/new' do
  @question = Question.find_by(id: params[:id])
  @choice = Choice.new
  erb :'/choices/new'
end

post '/choices' do
  # binding.pry
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
