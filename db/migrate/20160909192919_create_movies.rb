class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :hotness
      t.string :image_url
      t.text :synopsis
      t.string :rating
      t.string :genre
      t.string :director
      t.string :runtime
      t.integer :user_id

      t.timestamps
    end
  end
end
