class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    p "perform"
    if tweet.exists?(tweet_id)
      p "tweet_id #{tweet_id}"
      # tweet = # Encuentra el tweet basado en el 'tweet_id' pasado como argumento
      # user  = # Utilizando relaciones deberás encontrar al usuario relacionado con dicho tweet
      tweet = Tweet.find(tweet_id)
      user = TwitterUser.find(tweet.twitter_user_id)
      p user
      # Manda a llamar el método del usuario que crea un tweet (user.tweet)
      p "perform done"
      user.tweetear(tweet.text)
    end
  end
end
