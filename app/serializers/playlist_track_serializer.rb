class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id
  has_one :playlist
  has_one :track
end
