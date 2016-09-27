#display home
get '/' do
  @action = params[:action]
  erb :index 
end

#sign out
post '/sign_out' do
  session.clear
  redirect to ("/?action=SignOut")
end