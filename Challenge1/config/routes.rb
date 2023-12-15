Rails.application.routes.draw do
  resources :author_temps
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
  get '/filtrar_autor', to: 'authors#filtrar', as: 'filtrar_autor'
  get '/filtrar_peca', to: 'parts#filtrar', as: 'filtrar_peca'
  get '/filtrar_montagem', to: 'assemblies_parts#filtrar', as: 'filtrar_montagem'
  get '/filtrar_fornec_autor', to: 'suppliers#filtrar2', as: 'filtrar_fornec_autor'
 
  get '/relatorio', to: 'authors#relatorio', as: 'relatorio_autor'
  get '/relatorio/gerar', to: 'authors#gerar', as: 'gerar'
  get 'gerar_author_pdf', to: 'authors#gerar_author_pdf', as: 'gerar_author_pdf'

  resources :authors do
    get 'gerar', on: :member
  end
  get "up" => "rails/health#show", as: :rails_health_check
 
end
