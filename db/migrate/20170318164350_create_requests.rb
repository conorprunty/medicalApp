class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :details
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
