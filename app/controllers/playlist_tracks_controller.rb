class PlaylistTracksController < OpenReadController
  before_action :set_playlist_track, only: %i[show update destroy]

  # GET /playlist_tracks
  def index
    @playlist_tracks = PlaylistTrack.all

    render json: @playlist_tracks
  end

  # GET /playlist_tracks/1
  def show
    render json: PlaylistTrack.find(params[:id])
  end

  # POST /playlist_tracks
  def create
    @playlist_track = current_user.playlist_tracks.build(playlist_track_params)

    if @playlist_track.save
      render json: @playlist_track, status: :created, location: @playlist_track
    else
      render json: @playlist_track.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlist_tracks/1
  def update
    if @playlist_track.update(playlist_track_params)
      render json: @playlist_track
    else
      render json: @playlist_track.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlist_tracks/1
  def destroy
    @playlist_track.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_playlist_track
    @playlist_track = current_user.playlist_tracks.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def playlist_track_params
    params.require(:playlist_track).permit(:playlist_id, :track_id)
  end

  private :set_playlist_track, :playlist_track_params
end
