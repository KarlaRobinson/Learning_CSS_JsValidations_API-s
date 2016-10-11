class TwitterUser < ActiveRecord::Base
  validates :name, uniqueness: true
end
