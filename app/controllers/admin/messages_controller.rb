module Admin
  class MessagesController < BaseController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    # GET /messages
    # GET /messages.json
    def index
      @messages ||= Message.where(device_id: selected_device).order(created_at: :desc)
      unless params[:start_time].blank?
        start_date = DateTime.parse("#{params[:start_time]} 00:00:00")
        @messages = @messages.where("created_at >= :start_time", {start_time: start_date})
      end

      unless params[:end_time].blank?
        end_date = DateTime.parse("#{params[:end_time]} 23:59:59")
        @messages = @messages.where("created_at <= :end_time", {end_time: end_date})
      end
    end

    # GET /messages/1
    # GET /messages/1.json
    def show
    end

    # GET /messages/new
    def new
      @message = Message.new
    end

    # GET /messages/1/edit
    def edit
    end

    # POST /messages
    # POST /messages.json
    def create
      @message = Message.new(message_params)

      respond_to do |format|
        if @message.save
          format.html { redirect_to admin_message_path(@message), notice: 'Message was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @message }
          format.json {render :json => { :success => :created}}
        else
          format.html { render action: 'new' }
#          format.json { render json: @message.errors, status: :unprocessable_entity }
          format.json { render :json => {:errors => @message.errors, :success => :failed}, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /messages/1
    # PATCH/PUT /messages/1.json
    def update
      respond_to do |format|
        if @message.update(message_params)
          format.html { redirect_to admin_message_path(@message), notice: 'Message was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /messages/1
    # DELETE /messages/1.json
    def destroy
      @message.destroy
      respond_to do |format|
        format.html { redirect_to admin_messages_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = Message.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def message_params
        params.require(:message).permit(:uniqid, :contact_id, :msg_type, :message, :time, :device_id, :device_imei, :contact_number)
      end
  end
end
