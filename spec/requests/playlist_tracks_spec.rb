require 'rails_helper'

RSpec.describe "PlaylistTracks", type: :request do
  describe "GET /playlist_tracks" do
    it "works! (now write some real specs)" do
      get playlist_tracks_path
      expect(response).to have_http_status(200)
    end
  end
end
