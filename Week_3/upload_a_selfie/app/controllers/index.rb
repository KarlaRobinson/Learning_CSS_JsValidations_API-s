#display home
get '/' do
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

#upload a picture
get '/upload' do
  erb :upload
end

post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!

  redirect to ("/photo/#{@photo.id}")
end

#see/edit a single picture
get '/photo/:id' do
  @photo = Photo.find(params[:id])
  erb :edit
end


#see all picture
get '/photos' do
  @photos = Photo.all
  erb :pictures
end
