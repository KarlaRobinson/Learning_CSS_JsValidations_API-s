# before '/users/:id' do
#   if session[:id] == nil
#     redirect to ("/?action=Error")
#   elsif params[:id].to_i != current_user.id
#     redirect to ("/?action=Denied")
#   end
# end

post '/urls' do
  #create new url without logging in
  @long_url = params[:long_url]
  Url.create(long_url: @long_url)
  redirect to ('/')
end

post '/user_urls' do
  #create a url associated with a user
  current_user.urls << Url.create(long_url: params[:long_url])
  redirect to ("/users/#{current_user.id}")
end

get '/:short_url' do
  #go to the actual link
  object = Url.find_by({short_url: params[:short_url]})
  object.click_count += 1
  object.save
  redirect to ("#{object.long_url}")
end

get '/users/:id' do
  #enter the private profile fo a user
  @urls = current_user.urls
  erb :private_profile
end