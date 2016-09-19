get '/' do
  @urls = Url.all
  #@urls = Url.where(user_id: nil)
  @action = params[:action]
  erb :home
end

post '/sign_out' do
  session.clear
  redirect to ("/?action=SignOut")
end
