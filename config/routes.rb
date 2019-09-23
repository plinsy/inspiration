Rails.application.routes.default_url_options = {
	host: 'https://sayna-madagascar.herokuapp.com'
}
Rails.application.routes.draw do
  resources :conversations
  resources :messages
  ## Guest available links
  get '/acceuil', to: "pages#home",                   as: "acceuil"
  get '/àpropos', to: "pages#about",                  as: "apropos"
  get '/équipe', to: "pages#team",                    as: "equipe"
  get '/contact', to: "pages#contact",                as: "contact"
  
  ## Connected users
  get '/mon-dashboard', to: "pages#dashboard",        as: "mon_dashboard"
  get '/mon-profil', to: "users#show",                as: "mon_profil"
  get '/editer-mon-profil', to: "users#edit",         as: "editer_mon_profil"
  patch '/editer-mon-profil', to: "users#update"

  get '/mes-conversations', to: "conversations#index",as: "mes_conversations"
  get '/conversation/:id', to: "conversations#show"
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
    passwords: "users/passwords"
  }

  devise_scope :user do
    get "/connexion", to: "users/sessions#new",            as: "connexion"
    delete "/déconnexion", to: "users/sessions#destroy",   as: "deconnexion"
    get "/inscription", to: "users/registrations#new",     as: "inscription"
    post "/inscription", to: "users/registrations#create", as: "post_inscription"
  end

  resources :users

  ## Staff available links
  get "/tous-les-étudiants", to: "users#index", as: "tous_les_etudiants"
  get "/rechercher", to: "searches#new", as: "rechercher"
  post "/rechercher", to: "searches#create", as: "post_rechercher"

  root to: "pages#home"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
