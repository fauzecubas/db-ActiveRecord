class CreatePeople < ActiveRecord::Migration[6.1]
    def change
      create_table :people do |t|
        t.string :first_name
        t.string :last_name
        t.string :address
        t.string :city
  
        t.timestamps
      end
    end
  end
  