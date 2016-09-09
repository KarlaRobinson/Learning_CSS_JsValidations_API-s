get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/home.erb
  @message = params[:message]
  erb :home
end

post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  User.create(name: name, email: email, password: password)
  redirect to ('/signed_in')
end

post '/auth' do
  user = User.authenticate(params[:email], params[:password])
  if user == nil
    redirect to ("/?message=InvalidEntry")
  else
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :private_profile
end

# post '/sign_out' do
#   redirect to ("/?message=SignOut")
# end



# Iniciar Sesión
# Cerrar Sesión
# Crear cuenta de usuario
# Página secreta
# Redirigir a una persona que intenta ver la página secreta a iniciar sesión sin haber iniciado una sesión.

#cuatro rutas