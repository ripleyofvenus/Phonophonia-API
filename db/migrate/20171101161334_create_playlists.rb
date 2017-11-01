# frozen_string_literal: true

class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.text :name, null: false
      t.integer :user_id, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
