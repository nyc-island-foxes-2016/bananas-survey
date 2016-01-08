
get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
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

get '/surveys/new' do
  @survey = Survey.new
  @question = Question.new
  @choice = Choice.new
  erb :'surveys/new'
end

# => {"survey"=>{"user_id"=>"2", "title"=>"ksdfj"}, "question"=>{"text"=>"lskdjf"}, "choices"=>["lll", "hhh"]}

# post '/surveys' do
#   @survey = Survey.new(params[:survey])
#   @question = Question.new(params[:question])

#     params[:choices].each do |choice_text|
#       Choice.new(text: choice_text, question_id:)
#     end

#   redirect "/users/#{@user.id}"
# end

