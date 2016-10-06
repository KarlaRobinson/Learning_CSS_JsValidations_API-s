get '/' do
  @posts = Post.all
  erb :index
end

post '/post' do
  post = Post.new(comment: params[:comment], author: params[:author])
  return post.save ? 'true' : 'false'
end
