MekarUtama::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  get "new-home" => "new_home#index"
  get "about_us" => "about_us#index"
  get "clients" => "clients#index"
  get "products/:name" => "products#index", :as => "products"
  get "products/:name/:permalink" => "products#show", :as => "product"
  get "contact_us" => "contact_us#new", :as => "contact_us"
  post "contact_us" => "contact_us#create", :as => "contact_us"
  get "news" => "news#index", :as => "news"
  get "news/:id" => "news#show", :as => "show_news"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :only => [:create]

  match "admin" => "admin/dashboard#index", :as => "admin"
  post "admin/dashboard/change_password"

 namespace :admin do
    resources :banners
    resources :clients
    resources :features
    resources :news, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :products do
      resources :product_images, :only => [:create, :edit, :update, :destroy] do
        member do
          get 'set_primary'
          get 'set_best_seller'
        end
      end
    end
    resources :categories
    resources :product_images, :only => [:index]
    get "product_images/:id/new_product" => "product_images#new_product", :as => "product_images_new_product"
    post "product_images/:id/create_product" => "product_images#create_product", :as => "product_images_create_product"
    get "settings/:name/edit" => "settings#edit", :as => "edit_setting"
    put "settings/:name" => "settings#update", :as => "update_setting"

    
  end

  root :to => 'home#index'

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
