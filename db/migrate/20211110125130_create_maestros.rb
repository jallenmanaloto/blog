class CreateMaestros < ActiveRecord::Migration[6.1]
  def change
    create_table :maestros do |t|
      t.string :name
      t.string :musics

      t.timestamps
    end
  end
end
