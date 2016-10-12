class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :name, uniqueness: true

  def tweetear(text)
    #### twitter request!!! ####
    p "update"
    twitter_user.update(text)
  end

  def tweet_later(text, user_id)
    p "tweet start"
    # tweet = # Crea un tweet relacionado con este usuario en la tabla de tweets
    tweet = Tweet.create(text: text)
    user = TwitterUser.find(user_id.to_i)
    user.tweets << tweet
    # Este es un método de Sidekiq con el cual se agrega a la cola una tarea para ser
    # 
    p "tweet_later"
    TweetWorker.perform_async(tweet.id)
    #La última linea debe de regresar un sidekiq job id
  end
end


#"aedef9aaf46eccde26a39c6e"