# Mostrar todos los posts con un tag.
get '/tags/:id' do
  tag = Tag.all.find_by(text: params[:text])
  unless tag == nil
    @posts = tag.posts.map{|post| post}
  end
  @message = "posts with the hashtag ##{params[:text]}"
  erb :search
end