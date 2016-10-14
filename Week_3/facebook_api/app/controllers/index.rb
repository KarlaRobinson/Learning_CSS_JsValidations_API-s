get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

  # NOTE: When you enable cookie below in the FB.init call the GET request in the FB.login callback
  #       will send a signed request in a cookie back the OmniAuth callback which will parse out the
  #       authorization code and obtain an access_token with it.


# CALLBACK STEP
# - redirected here for server-side flow
# - ajax request made here for client-side flow
get '/auth/:provider/callback' do
  p "?" * 50
  content_type 'application/json'
  # auth_hash = request.env["omniauth.auth"]
  # Usa el método que creamos anteriormente para crear a tu usuario
  # p request.env["omniauth.auth"]
  p JSON.generate(request.env)

  p user = User.from_omniauth(request.env["omniauth.auth"])
  #TE COPIE ESTO ATTE. VANE

  # Inicia su sesión
  if user
    session[:id] = user.id
  end

  erb :profile
end


get '/logout' do
  session.clear
  erb :index
end





# post '/auth/facebook' do
#   redirect '/auth/facebook'
# end

# get '/auth/:provider/callback' do
#   access_token = params[:at]
#   p env["omniauth.auth"]
#   # env["omniauth.auth"] es un objeto que contiene la información necesaria para crear nuestro usuario después de haber sido autenticados.
#   # Esto se lo tenemos que mandar como argumento al método que crea al usuario.

#   # Usa el método que creamos anteriormente para crear a tu usuario
#   user = User.from_omniauth(env["omniauth.auth"])

#   # Inicia su sesión
#   session[:id] = user.id
# end

# get '/profile' do
#   erb :profile
# # Usa el método facebook que creamos para poder establecer la conexión con Facebook Graph API y a partir de ahí, hacer todas las demás peticiones que necesitamos.

# # Muestra en tu perfil tu imagen, la lista de tus amigos, y tu feed. INVESTIGA cómo hacer éstas peticiones al API.
# end