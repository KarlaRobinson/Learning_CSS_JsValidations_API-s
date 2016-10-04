#display home
get '/' do
  @photos = Photo.all
  @action = params[:action]
  erb :index 
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

#sign out
post '/sign_out' do
  session.clear
  redirect to ("/?action=SignOut")
end
