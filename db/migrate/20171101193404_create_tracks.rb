class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.text :title
      t.text :artist
      t.string :host_url, null: false

      t.timestamps
    end
  end
end
