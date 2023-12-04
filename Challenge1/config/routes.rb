Rails.application.routes.draw do
 
  resources :parts
  resources :assemblies_parts
  resources :authors
  resources :books
  resources :accounts
  resources :suppliers
  resources :assemblies

  get '/filtrar_fornecedores', to: 'suppliers#filtrar', as: 'filtrar_fornecedores'
  get '/filtrar_contas', to: 'accounts#filtrar', as: 'filtrar_contas'
  get '/filtrar_livros', to: 'books#filtrar', as: 'filtrar_livros'


  get "up" => "rails/health#show", as: :rails_health_check
 
end
