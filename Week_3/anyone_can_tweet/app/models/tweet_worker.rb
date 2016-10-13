class TweetWorker
  include Sidekiq::Worker

  sidekiq_options :retry => 5

  def perform(tweet_id)
    if Tweet.exists?(tweet_id)
      # tweet = # Encuentra el tweet basado en el 'tweet_id' pasado como argumento
      # user  = # Utilizando relaciones deberás encontrar al usuario relacionado con dicho tweet
      tweet = Tweet.find(tweet_id)
      user = TwitterUser.find(tweet.twitter_user_id)
      # Manda a llamar el método del usuario que crea un tweet (user.tweet)
      user.tweetear(tweet.id)
    end
  end
end
