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
  if @survey.save
    redirect "/questions/#{@survey.id}/new"
  else
    @errors = @survey.errors.full_messages
    redirect "/surveys/new"
  end
end
