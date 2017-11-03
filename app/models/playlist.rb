# frozen_string_literal: true

class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks
  validates :name, :user, presence: true
  accepts_nested_attributes_for :tracks, allow_destroy: true, update_only: true
end
