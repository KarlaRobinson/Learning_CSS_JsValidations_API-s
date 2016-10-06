class User < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true
end
