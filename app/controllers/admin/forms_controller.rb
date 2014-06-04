module Admin
  class FormsController < BaseController
    before_action :set_form, only: [:show, :destroy]

    # GET /forms
    # GET /forms.json
    def index
      @forms = Form.all
    end

    # GET /forms/1
    # GET /forms/1.json
    def show
    end

    # GET /forms/new
    def new
      @form = Form.new
      if !current_user
        render layout: "frontend"
      end
      
    end

    # GET /forms/1/edit
    def edit
    end

    # POST /forms
    # POST /forms.json
    def create
      @form = Form.new(form_params)

      respond_to do |format|
        if @form.save
          format.html { redirect_to contactus_path, notice: 'Form was successfully created.' }
          format.json { render action: 'show', status: :created, location: @form }
        else
          format.html { redirect_to contactus_path, notice: 'Form was failed to create.' }
          format.json { render json: @form.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /forms/1
    # PATCH/PUT /forms/1.json
    def update
      respond_to do |format|
        if @form.update(form_params)
          format.html { redirect_to admin_form_path(@form), notice: 'Form was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @form.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /forms/1
    # DELETE /forms/1.json
    def destroy
      @form.destroy
      respond_to do |format|
        format.html { redirect_to admin_forms_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_form
        @form = Form.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def form_params
        params.require(:form).permit(:name, :subject, :email, :phone, :message)
      end
  end
end