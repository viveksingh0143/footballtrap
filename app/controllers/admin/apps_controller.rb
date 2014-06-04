module Admin
  class AppsController < BaseController
    before_action :set_app, only: [:show, :edit, :update, :destroy]

    # GET /apps
    # GET /apps.json
    def index
      @apps ||= App.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @apps = @apps.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @apps = @apps.where("created_at <= :end_time", {end_time: end_date})
      end
    end

    # GET /apps/1
    # GET /apps/1.json
    def show
    end

    # GET /apps/new
    def new
      @app = App.new
    end

    # GET /apps/1/edit
    def edit
    end

    # POST /apps
    # POST /apps.json
    def create
      @app = App.new(app_params)

      respond_to do |format|
        if @app.save
          format.html { redirect_to admin_app_path(@app), notice: 'App was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @app }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @app.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @app.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /apps/1
    # PATCH/PUT /apps/1.json
    def update
      respond_to do |format|
        if @app.update(app_params)
          format.html { redirect_to admin_app_path(@app), notice: 'App was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @app.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /apps/1
    # DELETE /apps/1.json
    def destroy
      @app.destroy
      respond_to do |format|
        format.html { redirect_to admin_apps_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_app
        @app = App.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def app_params
        params.require(:app).permit(:program, :version, :package, :device_id, :device_imei)
      end
  end
end
