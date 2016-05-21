Rails.application.routes.draw do
  resources :stocks do
    get :autocomplete_outlet_outlet_name, on: :collection
    get :autocomplete_obat_obat_name, on: :collection
  end
  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  resources :users do
    collection {post :import}
  end

  resources :roles
  
  resources :obats do
    collection {post :import}
  end

  resources :krediturs
  
  resources :outlets do
    collection {post :import}
  end
  
  resources :positions
  resources :outlet_types
  resources :generiks
  resources :raciks
  resources :kategori_obats
  resources :pabriks do
    resources :kreditur_pabriks
  end
  resources :grup_obats
  resources :kemasans
  resources :dosages do
    collection { post :import }
  end
  resources :jenis_obats
  get 'dosages/:id/del' => 'dosages#del', as: :del_dosage
  get 'kemasans/:id/del' => 'kemasans#del', as: :del_kemasan
  get 'jenis_obats/:id/del' => 'jenis_obats#del', as: :del_jobat
  get 'grup_obats/:id/del' => 'grup_obats#del', as: :del_gobat
  get 'pabriks/:id/del' => 'pabriks#del', as: :del_pabrik
  get 'kategori_obats/:id/del' => 'kategori_obats#del', as: :del_kobat
  get 'raciks/:id/del' => 'raciks#del', as: :del_racik
  get 'generiks/:id/del' => 'generiks#del', as: :del_generik
  get 'outlet_types/:id/del' => 'outlet_types#del', as: :del_otype
  get 'positions/:id/del' => 'positions#del', as: :del_position
  get 'outlets/:id/del' => 'outlets#del', as: :del_outlet
  get 'krediturs/:id/del' => 'krediturs#del', as: :del_kreditur
  get 'obats/:id/del' => 'obats#del', as: :del_obat
  get 'roles/:id/del' => 'roles#del', as: :del_role
  get 'users/:id/del' => 'users#del', as: :del_user
  get 'stocks/:id/del' => 'stocks#del', as: :del_stock
  
  root to: "dosages#index"
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
