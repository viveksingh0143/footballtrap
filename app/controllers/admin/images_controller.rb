module Admin
  class ImagesController < BaseController
    before_action :set_image, only: [:show, :edit, :update, :destroy]
  
    # GET /images
    # GET /images.json
    def index
      @images ||= Image.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @images = @images.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @images = @images.where("created_at <= :end_time", {end_time: end_date})
      end
    end
  
    # GET /images/1
    # GET /images/1.json
    def show
    end

    # GET /images/1/display/thumb
    # GET /images/1/display/thumb.json
    def display
      @image = Image.find(params[:image_id])
      send_file @image.url_url(params[:version]).to_s, :disposition => 'inline', :type=>"application/jpg", :x_sendfile=>true
    end
  
    # GET /images/new
    def new
      @image = Image.new
    end
  
    # GET /images/1/edit
    def edit
    end
  
    # POST /images
    # POST /images.json
    def create
      @image = Image.new(image_params)
  
      respond_to do |format|
        if @image.save
          format.html { redirect_to admin_image_path(@image), notice: 'Image was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @image }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @image.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @image.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /images/1
    # PATCH/PUT /images/1.json
    def update
      respond_to do |format|
        if @image.update(image_params)
          format.html { redirect_to admin_image_path(@image), notice: 'Image was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /images/1
    # DELETE /images/1.json
    def destroy
      @image.destroy
      respond_to do |format|
        format.html { redirect_to admin_images_url }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Image.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def image_params
        params.require(:image).permit(:uniqid, :title, :capture, :url, :reference, :device_id, :device_imei)
      end
  end
end
