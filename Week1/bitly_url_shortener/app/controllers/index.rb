get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 

  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @urls = Url.all
  erb :index
end

post '/urls' do
  # crea una nueva Url
  @long_url = params[:long_url]
  Url.create(long_url: @long_url)
  redirect to ('/')
end

# e.g., /q6bda
get '/:short_url' do
  puts "inside get"
  @url_selected = params[:short_url]
  object = Url.find_by({short_url: @url_selected})
  object.click_count += 1
  object.save
  p object 
  redirect to ("#{object.long_url}")
end

#Deberás tener una ruta dentro de tu controlador que enliste todas las Urls y otra que por medio de un post cree un objeto url.



# needs to know how many elements to know how many to print in the index.erb
# needs ajax to know if one was clicked

#placeholder :
#toma cualquier alor