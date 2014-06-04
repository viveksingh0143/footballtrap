class UsersController < FrontendController
  before_action :save_login_state,  :only => [:new, :create]
  
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(signup_user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def signup_user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
