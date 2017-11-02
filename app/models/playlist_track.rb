# frozen_string_literal: true

class PlaylistTrack < ApplicationRecord
  belongs_to :playlist, inverse_of: :playlist_tracks
  belongs_to :track, inverse_of: :playlist_tracks
end
