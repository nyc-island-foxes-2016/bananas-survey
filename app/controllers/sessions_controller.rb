get '/login' do
  @user = User.new
  erb :login
end

post '/login' do
  @user = User.find_by(name: params[:user][:name])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @user = User.new(params[:user])
    @login_errors = ["Either the name or password is incorrect"]
    erb :login
  end
end

post '/signup' do
  @user = User.new(name: params[:user][:name], password: params[:user][:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @user = User.new(params[:user])
    @sign_up_errors = @user.errors.full_messages
    erb :login
  end
end


get '/logout' do
  session.clear
  redirect '/'
end
