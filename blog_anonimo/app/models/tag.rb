class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :text, uniqueness: true
  def validate!
    errors.add(:name, :blank, message: "cannot be nil") if name.nil?
  end
end
