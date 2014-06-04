module Admin
  class VideosController < BaseController
    before_action :set_video, only: [:show, :edit, :update, :destroy]
  
    # GET /videos
    # GET /videos.json
    def index
      @videos ||= Video.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @videos = @videos.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @videos = @videos.where("created_at <= :end_time", {end_time: end_date})
      end
    end
  
    # GET /videos/1
    # GET /videos/1.json
    def show
      #render :layout => false
    end

    # GET /videos/1/display
    # GET /videos/1/display
    def display
      @video = Video.find(params[:video_id])
#      send_file @video.url_url.to_s, :disposition => 'inline', :type=>"application/video", :x_sendfile=>true
      send_file(@video.url_url.to_s, :disposition => 'inline', :stream => true, :file_name => @video.title)
    end
  
    # GET /videos/new
    def new
      @video = Video.new
    end
  
    # GET /videos/1/edit
    def edit
    end
  
    # POST /videos
    # POST /videos.json
    def create
      @video = Video.new(video_params)
  
      respond_to do |format|
        if @video.save
          format.html { redirect_to admin_video_path(@video), notice: 'Video was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @video }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @video.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @video.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /videos/1
    # PATCH/PUT /videos/1.json
    def update
      respond_to do |format|
        if @video.update(video_params)
          format.html { redirect_to admin_video_path(@video), notice: 'Video was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @video.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /videos/1
    # DELETE /videos/1.json
    def destroy
      @video.destroy
      respond_to do |format|
        format.html { redirect_to admin_videos_url }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_video
        @video = Video.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def video_params
        params.require(:video).permit(:uniqid, :title, :capture, :url, :reference, :device_id, :device_imei)
      end
  end
end
