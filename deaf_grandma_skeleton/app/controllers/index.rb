get '/' do
  @abuelita = params[:abuelita]
  erb :index # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  if user_input.include? ("!")
    "NO, NO DESDE 1983"
  elsif user_input.downcase == "bye"
    "Adios!"
  else
    "HUH?! NO TE ESCUCHO, HIJO!"
  end
end