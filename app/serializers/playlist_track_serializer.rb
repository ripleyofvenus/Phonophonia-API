# frozen_string_literal: true

class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :playlist
  belongs_to :track
end
