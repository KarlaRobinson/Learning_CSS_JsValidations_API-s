class Url < ActiveRecord::Base
  before_create :shorten_url

  def shorten_url
    self.short_url = (("A".."Z").to_a.sample(3) + (0..9).to_a.sample(3)).shuffle.join("")
  end
end
