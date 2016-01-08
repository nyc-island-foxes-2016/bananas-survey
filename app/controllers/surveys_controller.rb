get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/:id' do
  binding.pry
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

delete '/surveys/:id' do
  @survey = Survey.find_by(id: params[:survey])
  @survey.destroy
  erb :'surveys/index'
end
