class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :platform
      t.float :price

      t.timestamps
    end
  end
end
