# frozen_string_literal: true

class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id
  has_many :playlist
  has_many :track
end
