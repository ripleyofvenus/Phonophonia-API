# frozen_string_literal: true

class Playlist < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true
end
