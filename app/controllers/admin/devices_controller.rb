module Admin
  class DevicesController < BaseController
    before_action :set_device, only: [:show, :edit, :update, :destroy]

    # GET /devices
    # GET /devices.json
    def index
      @devices = all_device
    end

    # GET /devices/1
    # GET /devices/1.json
    def show
    end

    # GET /devices/new
    def new
      @device = Device.new
    end

    # GET /devices/1/edit
    def edit
    end

    # POST /devices
    # POST /devices.json
    def create
      @device = Device.new(device_params)

      respond_to do |format|
        if @device.save
          format.html { redirect_to admin_device_path(@device), notice: 'Device was successfully created.' }
          format.json {render :json => { :success => :created}}
#          format.json { render action: 'show', status: :created, location: @device }
        else
          format.html { render action: 'new' }
          format.json { render :json => {:errors => @device.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /devices/1
    # PATCH/PUT /devices/1.json
    def update
      respond_to do |format|
        if @device.update(device_params)
          format.html { redirect_to admin_device_path(@device), notice: 'Device was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /devices/1
    # DELETE /devices/1.json
    def destroy
      @device.destroy
      respond_to do |format|
        format.html { redirect_to admin_devices_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def device_params
        params.require(:device).permit(:name, :imei, :serial_number, :devise_type, :os, :hardware_platform, :platform_string, :total_memory, :total_disk, :free_disk_space, :user_id, :deviceid, :device_software_version, :version_incremental, :os_version, :available_processors, :build_id, :build_board, :build_bootloader, :build_brand, :build_display, :build_fingerprint, :build_hardware, :build_host, :build_manufacturer, :build_model, :build_product, :build_serial, :build_tags, :build_time, :build_type, :build_unknown, :builduser, :build_cpu_abi, :build_cpu_abi2, :build_version_release, :build_version_sdk, :free_memory_latitude, :line1_number_longitude, :max_memory, :network_kountry_iso, :network_operator_name, :os_build_brand, :os_build_device, :os_build_manufacturer, :os_build_model, :os_build_version_release, :sim_kountry_iso, :sim_serial_number, :voice_mail_number)
      end

      def current_resource
        @current_resource ||= Device.find(params[:id]) if params[:id]
      end
  end
end
