# Mostrar todos los posts con un tag.
get '/tags/:id' do
  @posts = Tag.all.where(text: params[:text]).map{|ob| ob.posts[0]}
  puts "tag search"
  erb :search
end