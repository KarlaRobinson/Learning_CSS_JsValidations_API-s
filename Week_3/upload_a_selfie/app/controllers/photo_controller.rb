#upload a picture
get '/upload' do
  erb :upload
end

post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!
  if Album.find_by_title(params[:title]) == nil
    album = Album.new(title: params[:title])
    User.find(current_user.id).albums << album
  else
    album = Album.find_by_title(params[:title])
  end
  album.photos << @photo
  
  redirect to ("/photo/#{@photo.id}")
end

#see/edit a single picture
get '/photo/:id' do
  @photo = Photo.find(params[:id])
  erb :edit
end

#see all users picture
get '/photos/user/:id' do
  @albums = User.find(current_user.id).albums
  erb :_photos
end