Rails.application.routes.draw do
  get 'balance' => 'balance#index', as: :user_balance

  get 'balance/add'

  get 'balance/remove'
  patch 'balance' => 'balance#update'
  put 'balance' => 'balance#update'

  get 'search/results/' => 'search#results'

  get 'profile/edit' => 'profile#edit'
  get 'profile/:id' => 'profile#show', as: :profile
  get 'profile' => 'profile#redirect'
  patch 'profile' => 'profile#update'

  resources :books do
    resources :reviews
  end
  
  post 'transactions/create/' => 'transactions#create'
  get 'transactions/return_book/' => 'transactions#return_book'
  
  get 'welcome/index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'account' => 'account#home', as: :account_home
  resources :transactions

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
