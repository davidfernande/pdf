Rails3BootstrapDeviseCancan::Application.routes.draw do
  
  
  match '/404' => 'errors#not_found'
  match '/422' => 'errors#server_error'
  match '/500' => 'errors#server_error'

  match '/pdf' => "home#generate_pdf", :as => :generate_pdf

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "/huertos/new_from_file" => "huertos#new_from_file" , :as => :new_from_file_huertos
  match "/huertos/create_from_file" => "huertos#create_from_file" , :as => :create_from_file_huertos, :via => :post
  
  get "/planta/new_from_file" => "planta#new_from_file" , :as => :new_from_file_planta
  match "/planta/create_from_file" => "planta#create_from_file" , :as => :create_from_file_planta, :via => :post
    
  get "/contratos_steps/cupscall" => "contratos_steps#cupscall"
  get "/contratos_steps/get_provincias" => "contratos_steps#get_provincias"
  get "/contratos_steps/get_municipios" => "contratos_steps#get_municipios"
  get "/contratos_steps/get_codigopostal" => "contratos_steps#get_codigopostal"
  
  resources :contratos
  resources :precontratos
  resources :huertos
  resources :pruebas
  resources :contratos_steps
  resources :panels
  resources :home
  resources :planta
  
  authenticated :user do
    root :to => 'panels#index'
  end
  
  root :to => "home#index"

  devise_for :users
  resources :users
  get "huertopublico/:id" => "huertos#huertopublico"
  


end