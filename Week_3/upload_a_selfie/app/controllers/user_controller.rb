before '/users/:id' do
  if session[:id] != params[:id].to_i
  redirect to ("/?action=Error")
  end
end

#create new user
post '/user' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  user = User.create(name: name, email: email, password: password)
  if user.id == nil
    p user.errors
    url  = "/?action=Fail"
  else
    session[:id] = user.id
    url = "/users/#{user.id}"
  end
  url
end

#display a specific user
get '/users/:id' do
  @user = User.find(params[:id])
  @albums = User.find(current_user.id).albums
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

#display all users
get '/all/users' do
  @all = User.all
  erb :users
end

#delete a user
post '/delete/users/:id' do
  User.find(params[:id]).destroy
  redirect to ('/?action=Delete')
end





