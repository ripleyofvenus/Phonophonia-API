# frozen_string_literal: true

class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :editable

  def editable
    scope == object.user
  end
end
