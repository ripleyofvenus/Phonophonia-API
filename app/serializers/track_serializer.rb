# frozen_string_literal: true

class TrackSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :host_url, :user_id, :playlists, :editable

  def editable
    scope == object.user
  end
end
