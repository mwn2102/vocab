Rails.application.routes.draw do
  root 'pages#index'
  resources :pages
  post 'pages/update_row_order' => 'pages#update_row_order'

  
  # get 'pages' => 'pages#index'
  # get 'pages/new' => 'pages#new'
  # post 'pages' => 'pages#create'
  # get 'pages/destroy/:id' => 'pages#destroy', as: :destroy
  # get 'pages/:id/edit' => 'pages#edit', as: :edit #switched the edit and :id
  # patch 'pages/:id/edit' => 'pages#update'
  # get 'pages/:id' => 'pages#show', as: :show  #new addition, /:id or /show? 
  # get 'pages/next' => 'pages#next_page', as: :next #new addition
  
  
  
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
