class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
