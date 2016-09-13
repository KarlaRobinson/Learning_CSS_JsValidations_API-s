class Url < ActiveRecord::Base
  belongs_to :user

  before_create :shorten_url

  validates :long_url, uniqueness: true
  # validates :long_url, format: { with: /\bhttp\b/,
  # message: "Invalid url, must start with http."} #must have http in the url as a single word, so loose or http.sdfg or sdfgdsfg.http
  # #will show if you put a ! after create

  def shorten_url
    self.short_url = (("A".."Z").to_a.sample(3) + (0..9).to_a.sample(3)).shuffle.join("")
  end
end
