# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :user
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks
  validates :title, :artist, :host_url, :user, presence: true
end
