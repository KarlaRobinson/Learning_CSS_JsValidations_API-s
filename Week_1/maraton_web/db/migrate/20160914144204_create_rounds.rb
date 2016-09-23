class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :user, index: true
    end
  end
end
