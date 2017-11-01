class PlaylistsController < OpenReadController
  before_action :set_playlist, only: %i[update destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists
  end

  # GET /playlists/1
  def show
    render json: @playlist.find(params[:id])
  end

  # POST /playlists
  def create
    @playlist = current_user.playlists.build(playlist_params)

    if @playlist.save
      render json: @playlist, status: :created, location: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      # render json: @playlist
      head :no_content
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy

    head :no_content
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = current_user.playlist.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end

  # private
end
