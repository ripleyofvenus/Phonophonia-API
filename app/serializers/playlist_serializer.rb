# frozen_string_literal: true

class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :editable

  def editable
    scope == object.user
  end
end
