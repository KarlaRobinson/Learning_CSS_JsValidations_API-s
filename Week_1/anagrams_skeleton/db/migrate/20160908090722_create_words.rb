class CreateWords < ActiveRecord::Migration
  def change
      create_table :words do |t|
      t.string :base_word
      t.string :canonical
    end
  end
end
