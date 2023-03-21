Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  root to: "pages#home"
  get "motorista", to: "pages#moto"
  get "travels", to: "travels#viagem"
  get "saldos", to: "empenhos#saldo"
  get '/offline', to: 'pages#offline', as: :offline


  #post "patients/:id", to: "patients#change", as: :change_status

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :routes do
    resources :travels do
    end
  end

  resources :empenhos do
  end

  resources :vehicles do
  end

  resources :days do
  end

  resources :comprovantes do
  end

  get "teste", to: "days#teste"

  resources :users do
  end

  resources :travels do
    member do
      get "change"
      get "changeret"
      get "status"
    end
    #get "change/:id", to: "travels#change", as: :teste
    resources :patients do
    end
  end

  devise_scope :user do
    get "users", to: "registrations#index"
    post "sign_up", to: "registrations#create"
    post "admin_account", to: "registrations#create_admin_account"
    get "new_sign_up", to: "registrations#new", as: :new_sign_up
    get "edit/:id", to: "registrations#edit", as: :user_edit
    patch "update/:id", to: "registrations#update", as: :user_update
    delete "user_destroy/:id", to: "registrations#destroy", as: :user_destroy
  end
end
