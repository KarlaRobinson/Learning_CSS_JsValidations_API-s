get '/' do
  erb :index
end

post '/fetch' do
  username = params[:username]
  redirect "/#{username}"
end

# get '/:handle' do
#   @handle = CLIENT.user_timeline(params[:handle])
#   erb :tweets
# end

post '/tweet' do
  CLIENT.update(params[:text])
  redirect '/'
end

get '/:username' do
  # finds user if they exist and if not a new user is created
  @user = User.find_by_username(params[:username])
  if @user == nil
    @user = User.create(username: params[:username])
  end
  # if user has no tweets, tweets are downloaded into db from twitter
  "*"*50
  last_tweet = CLIENT.user_timeline(@user.username).first.text
  if @user.tweets.length == 0 || @user.tweets.where(text: last_tweet).length == 0
    p "*"*50
    p @user.tweets.where(text: last_tweet).length

    CLIENT.user_timeline(@user.username).each do |tweet|
        t = Tweet.new(text: tweet.text, post_date: tweet.created_at)
        if t.save
          @user.tweets << t
        end
    end
  end
  @user
  erb :tweets
end