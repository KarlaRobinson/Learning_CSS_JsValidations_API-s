before '/users/:id' do
  if session[:id] != params[:id].to_i
  redirect to ("/?action=Error")
  end
end

#display home
get '/' do
  @action = params[:action]
  erb :index 
end

#create new user
post '/user' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  user = User.create(name: name, email: email, password: password)
  if user == nil
    redirect to ("/?action=Fail")
  else
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  end  
end

#login
post '/login' do
  p user = User.authenticate(params[:email], params[:password])
  if user == nil
    redirect to ("/?action=InvalidEntry")
  else
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  end  
end

#display a specific user
get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

#update a user
post '/edit/users/:id' do
@user = User.find(params[:id])
user = User.authenticate(@user.email, params[:pass1])
  if user == nil
    redirect to ("/users/#{params[:id]}")
  else
    puts "else"
    if params[:name] != ""
      user.name = params[:name]
    elsif params[:email] != ""
      user.email = params[:email]
    elsif params[:pass2] != ""
      user.password = params[:pass2]
    end
    user.save
    redirect to ("/users/#{params[:id]}")
  end
end

#delete a user
post '/delete/users/:id' do
  User.find(params[:id]).destroy
  redirect to ('/?action=Delete')
end

#sign out
post '/sign_out' do
  session.clear
  redirect to ("/?action=SignOut")
end

#error
get '/error/:error' do
  @message = params[:error]
  erb :error
end




