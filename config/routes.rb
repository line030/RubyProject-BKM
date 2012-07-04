BodykitMe::Application.routes.draw do

  resources :aim_progresses

  #get "password_resets/new"

  resources :password_resets do
    member do
      get 'new'
    end
  end

  root :to => 'public#index'
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :countries

  resources :public

  resources :addresses do
  member do
      get "user"
    end
  end

  resources :user_sessions

  resources :users do
    collection do
      post "check_username"
      post "check_email"
    end
  end
  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"
  get "register" => "users#new"



  resources :workout_sessions do
    member do
      post 'update_thrill'
    end
  end
  
  resources :categories

  resources :aims do
    member do
      put 'invert_active'
      post 'add_new_aim_pro'
    end
  end

  resources :units

  resources :workout_plans do
    member do
      post 'click'
      post 'addWorkOut'
      post 'add_tag'
      post 'copy'
      get 'read_only'
      put 'invert_active'
    end

  end

  resources :workout_days do
    member do
      post 'addExistingExercise'
      post 'add_new_exercise'
      post 'add_tag'
    end

  end

  resources :exercises

  resources :member_area

  get "dashboard" => "member_area#index"

  resources :create_plan_wizard do
    member do
    post 'add_new_day'
    post 'add_new_exercise'
    end
  end


  #get "member_area" => "member_area#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
