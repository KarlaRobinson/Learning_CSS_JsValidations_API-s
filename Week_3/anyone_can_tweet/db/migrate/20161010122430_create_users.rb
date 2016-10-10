class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :access_token
      t.string :access_token_secret 
      t.timestamps
    end
  end
end
