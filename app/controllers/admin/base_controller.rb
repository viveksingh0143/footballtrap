module Admin
  class BaseController < ApplicationController
    layout "subscriber"
    before_action :authorize
    
    def all_device
      if current_user.admin
        @all_device ||= Device.all
      else
        @all_device ||= current_user.devices
      end
    end
    helper_method :all_device
    
    def selected_device
      if params[:device_id] && params[:device_id] != ""
        @selected_device ||= Device.find(params[:device_id])
      end
      @selected_device ||= all_device
    end
    helper_method :selected_device
  end
end
