class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.text :title, null: false
      t.text :artist, null: false
      t.string :host_url, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
