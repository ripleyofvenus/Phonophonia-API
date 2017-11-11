# frozen_string_literal: true

class TracksController < OpenReadController
  before_action :set_track, only: %i[show update destroy]

  # GET /tracks
  def index
    @tracks = Track.all

    render json: @tracks
  end

  # GET /tracks/1
  def show
    render json: Track.find(params[:id])
  end

  # POST /tracks
  def create
    @track = current_user.tracks.build(track_params)
    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tracks/1
  def update
    if @track.update(track_params)
      head :no_content
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tracks/1
  def destroy
    @track.destroy

    head :no_content
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = current_user.tracks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def track_params
      params.require(:track).permit(:title, :artist, :host_url)
    end

  private :set_track, :track_params
end
