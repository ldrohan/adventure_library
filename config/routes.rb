AdventureLibrary::Application.routes.draw do
  root 'adventures#index'

  resources :adventures do
    resources :pages
  end
  resources :libraries do
    resources :adventures
  end
#                 Prefix Verb   URI Pattern                                          Controller#Action
#                   root GET    /                                                    adventures#index
#        adventure_pages GET    /adventures/:adventure_id/pages(.:format)            pages#index
#                        POST   /adventures/:adventure_id/pages(.:format)            pages#create
#     new_adventure_page GET    /adventures/:adventure_id/pages/new(.:format)        pages#new
#    edit_adventure_page GET    /adventures/:adventure_id/pages/:id/edit(.:format)   pages#edit
#         adventure_page GET    /adventures/:adventure_id/pages/:id(.:format)        pages#show
#                        PATCH  /adventures/:adventure_id/pages/:id(.:format)        pages#update
#                        PUT    /adventures/:adventure_id/pages/:id(.:format)        pages#update
#                        DELETE /adventures/:adventure_id/pages/:id(.:format)        pages#destroy
#             adventures GET    /adventures(.:format)                                adventures#index
#                        POST   /adventures(.:format)                                adventures#create
#          new_adventure GET    /adventures/new(.:format)                            adventures#new
#         edit_adventure GET    /adventures/:id/edit(.:format)                       adventures#edit
#              adventure GET    /adventures/:id(.:format)                            adventures#show
#                        PATCH  /adventures/:id(.:format)                            adventures#update
#                        PUT    /adventures/:id(.:format)                            adventures#update
#                        DELETE /adventures/:id(.:format)                            adventures#destroy
#     library_adventures GET    /libraries/:library_id/adventures(.:format)          adventures#index
#                        POST   /libraries/:library_id/adventures(.:format)          adventures#create
#  new_library_adventure GET    /libraries/:library_id/adventures/new(.:format)      adventures#new
# edit_library_adventure GET    /libraries/:library_id/adventures/:id/edit(.:format) adventures#edit
#      library_adventure GET    /libraries/:library_id/adventures/:id(.:format)      adventures#show
#                        PATCH  /libraries/:library_id/adventures/:id(.:format)      adventures#update
#                        PUT    /libraries/:library_id/adventures/:id(.:format)      adventures#update
#                        DELETE /libraries/:library_id/adventures/:id(.:format)      adventures#destroy
#              libraries GET    /libraries(.:format)                                 libraries#index
#                        POST   /libraries(.:format)                                 libraries#create
#            new_library GET    /libraries/new(.:format)                             libraries#new
#           edit_library GET    /libraries/:id/edit(.:format)                        libraries#edit
#                library GET    /libraries/:id(.:format)                             libraries#show
#                        PATCH  /libraries/:id(.:format)                             libraries#update
#                        PUT    /libraries/:id(.:format)                             libraries#update
#                        DELETE /libraries/:id(.:format)                             libraries#destroy             
                       
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
