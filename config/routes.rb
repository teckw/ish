Rails.application.routes.draw do  


  #Sessions routes

  get '/about' => 'sessions#about'

  post '/login' => 'sessions#login'

  delete '/logout' => 'sessions#logout'


  # Users routes


  get '/' => 'users#index'

  get '/edit/:id' => 'users#edit'

  get '/users' => 'users#main'

  post '/new' => 'users#create'

  patch '/update/user/:id' => 'users#update'


  #Items routes


  get '/items/create' => 'items#create'

  post '/items/create' => 'items#new'

  get '/items/show' => 'items#show'

  patch '/items/update/:id' => 'items#update'

  delete '/items/delete/:id' => 'items#delete'

  get '/checkout' => 'charges#new'

  post '/unlike/:id' => 'items#unlike'

  post '/like/:id' => 'items#like'

  resources :items

  resources :charges

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'items/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'items/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :items

  # Example resource route with options:
  #   resources :items do
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
  #   resources :items do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :items do
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
  #     # Directs /admin/items/* to Admin::itemsController
  #     # (app/controllers/admin/items_controller.rb)
  #     resources :items
  #   end
end
