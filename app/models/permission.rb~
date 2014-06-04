class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == 'admin/apps' && user.admin
    return true if controller == 'admin/contacts' && user.admin
    return true if controller == 'admin/locations' && user.admin
    return true if controller == 'admin/logs' && user.admin
    return true if controller == 'admin/messages' && user.admin

    return true if controller == 'admin/devices' && user.admin
    return true if controller == 'admin/pages' && user.admin
    return true if controller == 'admin/users' && user.admin
    return true if controller == 'sessions' && action.in?(%w[index]) && user
    return true if controller == 'users' && action.in?(%w[new create])
    return false
  end
end
