Footballtrap::Application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'signup',     to: 'users#new',        as: :signup
  get 'signin',     to: 'sessions#new',     as: :signin
  get 'demo',       to: 'sessions#demo',    as: :demo
  get 'signout',    to: 'sessions#destroy', as: :signout
  delete 'signout', to: 'sessions#destroy', as: :signout_delete
  get 'home',       to: 'sessions#index',   as: :dashboard
  get 'reset',      to: 'sessions#reset',   as: :reset
  get '/contactus',:to => 'admin/forms#new', :as => 'contactus'
    

  namespace :admin do
    resources :users
    resources :pages
    resources :forms, only: [:create, :new, :index, :show]
    resources :devices
    resources :messages
    resources :logs
    resources :apps
    resources :contacts
    resources :locations
    resources :images do
      get 'display/:version', :action => 'display', :as => 'display'
    end
    resources :audios do
      get 'display'
    end
    resources :videos do
      get 'display'
    end
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:index, :new, :create]
  resources :pages, only: [:show]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => "pages#show", :id => 'home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
