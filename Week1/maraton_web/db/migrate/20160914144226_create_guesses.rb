class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :round, index: true
      t.integer :tries
      t.string :result
    end
  end
end
