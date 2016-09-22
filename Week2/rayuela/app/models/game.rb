class Game < ActiveRecord::Base
  has_many :game_players
  has_many :players, through: :game_players
  validates_length_of :players, maximum: 2
  # validate :max_two

  # def max_two
  #   if self.players.length > 2
  #     errors.add(:player, "there can only be two players per game")
  #   end
  # end


end

