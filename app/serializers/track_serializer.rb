class TrackSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :host_url
end
