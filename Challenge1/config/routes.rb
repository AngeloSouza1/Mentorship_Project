Rails.application.routes.draw do
 
  resources :parts
  resources :assemblies_parts
  resources :authors
  resources :books
  resources :accounts
  resources :suppliers
  resources :assemblies

  get '/filtrar_fornecedores', to: 'suppliers#filtrar', as: 'filtrar_fornecedores'



  get "up" => "rails/health#show", as: :rails_health_check
 
end
