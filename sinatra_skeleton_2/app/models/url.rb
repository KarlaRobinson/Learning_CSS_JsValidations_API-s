class Url < ActiveRecord::Base
  before_create :shorten_url

  def shorten_url
    new_url = long_url.slice(0..26)
    self.short_url = new_url.slice(10..26)
  end

  def self.list
    urls = []
    self.all.each do |object|
      holder = []
      holder << object.short_url
      holder << object.long_url
      urls << holder
    end
    urls
  end
end
