Rails.application.routes.draw do  

  resources :transaksis do
    resources :dtrans do
      get :autocomplete_obat_obat_name, on: :collection
      get :i_ask, on: :collection
      get :i_drop, on: :collection
      get :i_accept, on: :collection
    end
    member do
      get 'show_ask'
      get 'show_drop'
      get 'show_accept'
      get 'skrip_bpba'
      get 'skrip_drop'
      get 'skrip_accept'
      get 'validate_ask'
      get 'validate_drop'
      get 'validate_accept'
      get 'valdrop'
      get 'del'
    end
    collection do
      post :get_accept
      get :autocomplete_outlet_outlet_name
      get :ask
      get :drop
      get :accept
      get :reports
      get :report_ask
      get :report_drop
      get :report_accept
      post :report_ask_control
      get :report_ask_control
      post :report_drop_control
      get :report_drop_control
      post :report_accept_control
      get :report_accept_control
    end
  end
  
  resources :activities

  resources :obat_ins do
    member do
      get 'valter'
    end
    collection do
      post 'kirim'
    end
  end

  devise_for :users
  scope "/admin" do
    resources :users
  end


  resources :stocks do
    get :autocomplete_outlet_outlet_name, on: :collection
    get :autocomplete_obat_obat_name, on: :collection
    collection {post :import}
  end
  
  resources :users do
    collection {post :import}
  end

  resources :roles
  
  resources :obats do
    get :autocomplete_obat_obat_name, on: :collection
    collection {post :import}
  end

  resources :krediturs do
    collection {post :import}
  end
  
  resources :outlets do
    collection {post :import}
  end
  
  resources :positions

  resources :outlet_types

  resources :generiks do
    collection { post :import}
  end

  resources :raciks

  resources :kategori_obats do
    collection {post :import}
  end

  resources :pabriks do
    resources :kreditur_pabriks
  end

  resources :grup_obats do
    collection {post :import}
  end

  resources :kemasans

  resources :dosages do
    collection { post :import }
  end

  resources :dashboard

  get 'dosages/:id/del' => 'dosages#del', as: :del_dosage
  get 'kemasans/:id/del' => 'kemasans#del', as: :del_kemasan
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
  
  root to: "dashboard#index"
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
