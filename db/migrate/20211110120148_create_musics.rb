class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      add_column :title, :body, :string
      t.timestamps
    end
  end
end
