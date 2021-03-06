Rails.application.routes.draw do

    devise_for :users

    # for root page & user specific pages
    root "test#welcome"
    get 'home' => "test#home"
    get 'users/:id' => "test#profile", as: :profile
    get "users/:id/wishlist" => "wishlists#user_index", as: :user_wishlist
    get "users/:id/events" => "events#user_index", as: :user_event
    get 'users/:id/friends' => "friendships#show", as: :friend

    # Products
    get 'products' => "products#index"
    get 'products/search' =>  "products#search"
    get 'products/:category' => "categories#index", as: :category


    # Mutual Friendship
    get 'friendships' => "friendships#index"
    post 'friendships' => "friendships#create"
    put 'friends' => "friendships#update"
    delete 'friends' => "friendships#destroy"

    # Events
    resources :events, except: :index

    # Wishlists
    get 'wishlists/add/:id' => "wishlists#add", as: :addtowishlist

    resources :wishlists, except: :index do
        collection do
              put :called_dibs
              put :remove
        end
    end

    # Status
    resources :statuses, only: :create

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
