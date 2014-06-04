module Admin
  class AudiosController < BaseController
    before_action :set_audio, only: [:show, :edit, :update, :destroy]
  
    # GET /audios
    # GET /audios.json
    def index
      @audios ||= Audio.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @audios = @audios.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @audios = @audios.where("created_at <= :end_time", {end_time: end_date})
      end
    end
  
    # GET /audios/1
    # GET /audios/1.json
    def show
    end

    # GET /audios/1/display
    # GET /audios/1/display
    def display
      @audio = Audio.find(params[:audio_id])
      send_file @audio.url_url.to_s, :disposition => 'inline', :stream => true, :file_name => @audio.title
    end
  
    # GET /audios/new
    def new
      @audio = Audio.new
    end
  
    # GET /audios/1/edit
    def edit
    end
  
    # POST /audios
    # POST /audios.json
    def create
      @audio = Audio.new(audio_params)
  
      respond_to do |format|
        if @audio.save
          format.html { redirect_to admin_audio_path(@audio), notice: 'Audio was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @audio }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @audio.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @audio.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /audios/1
    # PATCH/PUT /audios/1.json
    def update
      respond_to do |format|
        if @audio.update(audio_params)
          format.html { redirect_to admin_audio_path(@audio), notice: 'Audio was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @audio.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /audios/1
    # DELETE /audios/1.json
    def destroy
      @audio.destroy
      respond_to do |format|
        format.html { redirect_to admin_audios_url }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audio
        @audio = Audio.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def audio_params
        params.require(:audio).permit(:uniqid, :title, :capture, :url, :reference, :device_id, :device_imei)
      end
  end
end
