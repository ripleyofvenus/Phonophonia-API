require "rails_helper"

RSpec.describe PlaylistTracksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/playlist_tracks").to route_to("playlist_tracks#index")
    end


    it "routes to #show" do
      expect(:get => "/playlist_tracks/1").to route_to("playlist_tracks#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/playlist_tracks").to route_to("playlist_tracks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/playlist_tracks/1").to route_to("playlist_tracks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/playlist_tracks/1").to route_to("playlist_tracks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/playlist_tracks/1").to route_to("playlist_tracks#destroy", :id => "1")
    end

  end
end
