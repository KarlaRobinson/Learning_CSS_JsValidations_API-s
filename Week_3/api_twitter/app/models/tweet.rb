class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, uniqueness: true
end
