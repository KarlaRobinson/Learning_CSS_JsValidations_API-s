class Player < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :game_players
  has_many :games, through: :game_players
end
