# frozen_string_literal: true

class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id, :playlist_id, :track_id
end
