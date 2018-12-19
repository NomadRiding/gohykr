class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.integer :rating
      t.text :bio

      t.timestamps
    end
  end
end
