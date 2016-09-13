before '/users/:id' do
  if session[:id] == nil
    redirect to ("/?action=Error")
  elsif params[:id].to_i != current_user.id
    redirect to ("/?action=Denied")
  end
end

post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  user = User.create(name: name, email: email, password: password)
  session[:id] = user.id
  redirect to ("/users/#{user.id}")
end

post '/auth' do
  user = User.authenticate(params[:email], params[:password])
  if user == nil
    redirect to ("/?action=InvalidEntry")
  else
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  end
end

