class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
