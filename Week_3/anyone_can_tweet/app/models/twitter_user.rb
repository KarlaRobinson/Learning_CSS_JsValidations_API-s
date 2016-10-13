class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :name, uniqueness: true

  def tweetear(tweet_id)
    tweet = Tweet.find(tweet_id)
    tweet.post_date = Time.now.utc
    tweet.save
    #### twitter request!!! ####
    self.twitter_user.update(tweet.text)
  end

  def tweet_later(text, time = 0)
    tweet = Tweet.create(text: text)
    self.tweets << tweet
    # Sidekiq method to add this task to background jobs list
    TweetWorker.perform_in(time.to_i, tweet.id)
    # TweetWorker.perform_async(tweet.id)
    #returns the job id with which the task status can be discovered
  end

  def twitter_user
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.access_token
      config.access_token_secret = self.access_token_secret
    end
  end
end