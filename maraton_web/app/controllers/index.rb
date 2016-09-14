get '/' do
  @action = params[:action]
  erb :home
end

get '/stats' do
  erb :stats
end

get '/setup' do 
  erb :setup
end