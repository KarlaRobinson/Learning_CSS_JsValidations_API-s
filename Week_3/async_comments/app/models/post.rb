class Post < ActiveRecord::Base
  validates :comment, uniqueness: true
end
