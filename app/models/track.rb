# frozen_string_literal: true

class Track < ApplicationRecord
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks
end
