# Mostrar todos los posts.
get '/posts' do
  @posts = Post.all
  erb :wall
end

# Mostrar un post determinado.
get '/posts/:id' do
  @posts = Post.all.where(title: params[:title])
  erb :search
end

#Crear un post nuevo.
get '/post/new' do
  erb :new
end

post '/posts' do
  post = Post.create(title: params[:title], body: params[:body])
  post.tags << Tag.create(text: params[:tag1])
  post.tags << Tag.create(text: params[:tag2])
  redirect to ('/posts')
end

# Editar un post existente.
get '/post/edit' do
  @post = Post.all.find(params[:post_id])
  erb :edit
end

post '/post/edit' do
  post = Post.all.find(params[:post_id])

  unless params[:title] == nil
  post.title = params[:title]
  end

  unless params[:body] == nil
  post.body = params[:body]
  end
  
  unless params[:tag1] == nil
  tag1 = Tag.all.find_by(text: post.tags[0].text)
  tag.text = params[:tag1]
  end
  
  unless params[:tag2] == nil
  tag2 = Tag.all.find_by(text: post.tags[1].text)
  tag.text = params[:tag2]
  end

  tag1.save
  tag2.save
  post.save
  redirect to ('/posts')
end

# Eliminar un post existente.
post '/post/delete' do
  Post.all.find(params[:post_id]).destroy
  redirect to ('/posts')
end


#tags with no posts need to be deleted too!
#check if the tag already exists before creating a new one
#update doesn't work


