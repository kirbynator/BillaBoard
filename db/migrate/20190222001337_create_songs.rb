class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :chart, foreign_key: true
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
