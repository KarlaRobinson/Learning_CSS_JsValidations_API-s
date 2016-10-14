get '/' do
  erb :index
end

get '/auth/:provider/callback' do
  request.env["omniauth.auth"]
  p "*" * 50
  p user = User.from_omniauth(request.env["omniauth.auth"])

  # Inicia su sesión
  # if user
    session[:id] = user.id
  # end
  ''
end

get '/profile' do
  p "*/" * 50
  p @graph = current_user.facebook #Koala funcion
  # p @graph.get_object("me")
  # p name = @graph.get_object('me')['name']
  # p @graph.get_connections("me", "feed")
  # p @graph.get_object("10211387752353795", {fields: ["context"]})
  # p @graph.get_connections("10211387752353795", "friends")
  # p @graph.put_wall_post("hey, i'm learning koala")

# Usa el método facebook que creamos para poder establecer la conexión con Facebook Graph API 
#y a partir de ahí, hacer todas las demás peticiones que necesitamos.

# Muestra en tu perfil tu imagen, la lista de tus amigos, y tu feed. 
# INVESTIGA cómo hacer éstas peticiones al API.
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
