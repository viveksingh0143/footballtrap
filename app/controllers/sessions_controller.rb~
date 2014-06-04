class SessionsController < FrontendController
  before_action :authorize, :only => [:index]
  before_action :save_login_state,  :only => [:new, :create]

  def index
    redirect_to :admin_devices
  end

  def new
  end

  def create
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to :root
    else
      flash[:notice] = "Invalid Username or Password"
      render "new"  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :action => 'new'
  end
end
