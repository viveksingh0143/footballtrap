class SessionsController < FrontendController
  before_action :authorize, :only => [:index, :reset]
  before_action :save_login_state,  :only => [:new, :create, :demo]

  def index
    redirect_to :admin_devices
  end

  def new
  end

  def demo
  end

  def reset
    #App.delete_all
    #Contact.delete_all
    #Device.delete_all
    #Location.delete_all
    #Log.delete_all
    #Message.delete_all
    Audio.delete_all
    Image.delete_all
    Video.delete_all
    Location.all.each do |location|
      location.save
    end
    flash[:notice] = "All the models have reset"
    redirect_to :dashboard
  end

  def create
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to :dashboard
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