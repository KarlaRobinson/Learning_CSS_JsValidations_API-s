get '/' do
  erb :index
end

post '/tweet' do
  twitter_user.update(params[:text])
  erb :profile
end

get '/fetch' do
  p @user = params[:username]
  erb :profile
end

get '/sign_in' do
  # session.delete(:request_token) 
  # El método `request_token` es uno de los helpers
  # Esto lleva al usuario a una página de twitter donde sera atentificado con sus credenciales
  p "host and port: #{host_and_port}"
  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")
  # Cuando el usuario otorga sus credenciales es redirigido a la callback_url 
  # Dentro de params twitter regresa un 'request_token' llamado 'oauth_verifier'
end

get '/auth' do
  # Volvemos a mandar a twitter el 'request_token' a cambio de un 'acces_token' 
  # Este 'acces_token' lo utilizaremos para futuras comunicaciones. 
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # Despues de utilizar el 'request token' ya podemos borrarlo, porque no vuelve a servir. 
  session.delete(:request_token)

  # Aquí es donde deberás crear la cuenta del usuario y guardar usando el 'access_token' lo siguiente:
  name = @access_token.params[:screen_name]
  token = @access_token.token
  secret = @access_token.secret
  user = TwitterUser.find_by_name(name)
  if user == nil
    user = TwitterUser.new(name: name, access_token: token, access_token_secret: secret)
    if user.save
      session[:user_id] = user.id
      erb :profile
    else
      p "fail"
    end
  else
    session[:user_id] = user.id
    erb :profile
  end
end

get '/logout' do
  session.clear
  erb :index
end








