get '/' do
  @abuelita = params[:abuelita]
  erb :index # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  if user_input.include? ("!")
    @message = "NO, NO DESDE 1983"
  elsif user_input.downcase == "bye"
    @message = "Adios!"
  else
    @message = "HUH?! NO TE ESCUCHO, HIJO!"
  end
  redirect to "/?abuelita=#{@message}"
end