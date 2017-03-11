class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :Name
      t.string :Date_of_Birth
      t.string :Address
      t.numeric :Phone_Number
      t.string :Infection
      t.string :Injury

      t.timestamps
    end
  end
end
