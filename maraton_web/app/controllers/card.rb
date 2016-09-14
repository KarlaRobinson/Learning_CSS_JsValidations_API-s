get '/card:id' do
  @guess = params[:guess]
  erb :play
end