module Admin
  class LocationsController < BaseController
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    # GET /locations
    # GET /locations.json
    def index
      @locations ||= Location.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @locations = @locations.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @locations = @locations.where("created_at <= :end_time", {end_time: end_date})
      end
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.json({ infowindow: location.address, name: location.time.strftime("%d-%m-%Y %H:%M") })
      end
    end

    # GET /locations/1
    # GET /locations/1.json
    def show
    end

    # GET /locations/new
    def new
      @location = Location.new
    end

    # GET /locations/1/edit
    def edit
    end

    # POST /locations
    # POST /locations.json
    def create
      @location = Location.new(location_params)

      respond_to do |format|
        if @location.save
          format.html { redirect_to admin_location_path(@location), notice: 'Location was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @location }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @location.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @location.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /locations/1
    # PATCH/PUT /locations/1.json
    def update
      respond_to do |format|
        if @location.update(location_params)
          format.html { redirect_to admin_location_path(@location), notice: 'Location was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /locations/1
    # DELETE /locations/1.json
    def destroy
      @location.destroy
      respond_to do |format|
        format.html { redirect_to admin_locations_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_location
        @location = Location.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def location_params
        params.require(:location).permit(:latitude, :longitude, :time, :address, :device_id, :device_imei)
      end
  end
end
