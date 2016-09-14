# Mostrar todos los posts.
get '/posts' do
  @posts = Post.all
  erb :wall
end

# Mostrar un post determinado.
get '/posts/:id' do
  if Post.all.exists?(title: params[:title])
    @posts = Post.all.where(title: params[:title])
  else
   @posts = nil
  end
  @message = "posts with the title: #{params[:title]}"
  erb :search
end

#Crear un post nuevo.
get '/post/new' do
  erb :new
end

post '/posts' do
  post = Post.create(title: params[:title], body: params[:body])
  if post.valid?
    params[:tag].split(",").each do |tag|
      if Tag.exists?(text: tag.strip)
        post.tags << Tag.all.find_by(text: tag.strip)
      else
        post.tags << Tag.create(text: tag.strip)
      end
    end
    redirect to ('/posts')
  else
    @error = post.errors.messages
    erb :new
  end
end

# Editar un post existente.
get '/post/edit' do
  @post = Post.all.find(params[:post_id])
  erb :edit
end

post '/post/edit' do
  post = Post.all.find(params[:post_id])

  if params[:title] == nil
    post.title = post.title
  else 
    post.title = params[:title]
  end

  if params[:body] == nil
    post.body = post.body
  else
    post.body = params[:body]
  end
  
  if params[:tag] == nil
    post.tags = post.tags
  else
    post.tags.each do |tag|
      tag.destroy if tag.posts.length < 2
    end
    post.tags.clear
    params[:tag].split(",").each do |tag|
      if Tag.exists?(text: tag.strip)
        post.tags << Tag.all.find_by(text: tag.strip)
      else
        post.tags << Tag.create(text: tag.strip)
      end
    end
  end

  post.save!
  redirect to ('/posts')
end

# Eliminar un post existente.
post '/post/delete' do
  post = Post.all.find(params[:post_id])
  post.tags.each do |tag|
    tag.destroy if tag.posts.length < 2
  end
  post.destroy
  redirect to ('/posts')
end


