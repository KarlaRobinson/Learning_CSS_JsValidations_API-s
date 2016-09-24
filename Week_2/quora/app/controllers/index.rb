#display home
get '/' do
  @action = params[:action]
  erb :index 
end
