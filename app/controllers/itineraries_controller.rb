class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /itineraries
  # GET /itineraries.json
  def index
    @itineraries = Itinerary.all.order(:start_date)
    @current_user = User.find(session[:user_id])
    respond_to do |format|
      format.html do
        @itineraries = @itineraries.map{ |i| ::ItineraryPresenter.new(i) }
      end
      format.json do
        page        = (params[:page] || 1).to_i
        per_page    = 5
        total_pages = (@itineraries.count.to_f / per_page).ceil
        total_pages = 1 if total_pages.zero?
        @itineraries      = @itineraries.paginate(page: page, per_page: per_page)
        render json: { itineraries: @itineraries, page: page, totalPages: total_pages }
      end
    end
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
    @current_user = User.find(session[:user_id])
    @itinerary = ::ItineraryPresenter.new(@itinerary)
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }

        origin = @itinerary.locations.new( address: params[:origin], is_origin: true )
        origin.get_coords

        destination = @itinerary.locations.new( address: params[:destination], is_origin: false )
        destination.get_coords

      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary }

        if params[:origin]
          @itinerary.locations[0].address = params[:origin]
          @itinerary.locations[0].get_coords
        end
        if params[:destination]
          @itinerary.locations[0].address = params[:destination]
          @itinerary.locations[0].get_coords
        end

      else
        format.html { render :edit }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url, notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:start_date, :end_date, :available_seat, :projected_eta, :description, :user_id, :avatar_image)
    end
end
