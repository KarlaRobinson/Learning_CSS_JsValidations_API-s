# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # t.string :first_name
      # t.string :last_name
      # t.string :gender
      # t.date :birthday
      # t.string :email 
      # t.string :phone

      # t.timestamps
    end
  end
end
