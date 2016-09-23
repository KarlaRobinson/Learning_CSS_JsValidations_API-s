class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :player, index: true
    end
  end
end
