class Permission
  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :pages, [:show]
    allow 'admin/forms', [:new, :create]
    allow 'contactus', [:new, :create]
    # start creating from devices
    allow 'admin/devices', [:create]
    allow 'admin/logs', [:create]
    allow 'admin/contacts', [:create]
    allow 'admin/messages', [:create]
    allow 'admin/locations', [:create]
    allow 'admin/apps', [:create]
    allow 'admin/images', [:create]
    allow 'admin/audios', [:create]
    allow 'admin/videos', [:create]
    # end creating from devices
    if user
      allow :sessions, [:index]
      allow 'admin/devices', [:index]
      allow 'admin/logs', [:index]
      allow 'admin/contacts', [:index]
      allow 'admin/messages', [:index]
      allow 'admin/locations', [:index]
      allow 'admin/apps', [:index]
      allow 'admin/images', [:index, :display]
      allow 'admin/audios', [:index, :display]
      allow 'admin/videos', [:index, :display]
      allow_all if user.admin?

#      allow :topics, [:edit, :update] do |topic|
#        topic.user_id == user.id
#      end
#      allow_param :topic, [:name]

#      allow 'admin/apps', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/contacts', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/locations', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/messages', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/devices', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/pages', [:index, :show, :new, :edit, :create, :update, :destroy]
#      allow 'admin/users', [:index, :show, :new, :edit, :create, :update, :destroy]
    end
  end
  
  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end
  
  def allow_all
    @allow_all = true
  end
  
  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end
end
