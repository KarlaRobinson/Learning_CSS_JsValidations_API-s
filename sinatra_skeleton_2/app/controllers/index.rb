get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 

  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @urls = Url.list
  erb :index
end

post '/urls' do
  # crea una nueva Url
  # Url.shorten_url
  @long_url = params[:long_url]
  Url.create(long_url: @long_url)
  redirect to ('/:short_url')
end

# e.g., /q6bda
get '/:short_url' do
  @urls = Url.list
  erb :index
  # redirige a la URL original
end

#Deberás tener una ruta dentro de tu controlador que enliste todas las Urls y otra que por medio de un post cree un objeto url.



# needs to know how many elements to know how many to print in the index.erb
# needs ajax to know if one was clicked