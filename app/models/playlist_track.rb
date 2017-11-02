#frozen_string_literal

class PlaylistTrack < ApplicationRecord
  belongs_to :playlist
  belongs_to :track, inverse_of: :Playlists
end
