JaneslunchCom::Application.routes.draw do

  get "info/about"

  get "info/contact"

  get "info/terms"

  get "info/security"

  get "info/suggestions"

  root :to => "site#index"
  
  resources :user do
    member do
        get 'join'
        get 'ignore'
      end
  end
      
  resources :groups 
  
  resources :items

  resources :ordr_accounts
  
  devise_for :users #:controllers => { :invitations => 'users/invitations' }

  get "/groups/:id/invitations/new" => "invitations#new", :as => "new_group_invitation" 

  post "groups/:id/invitations/create" => "invitations#create", :as => "create_group_invitation"

  # get "groups/:id/invitations/accept" => "invitations#edit", :as => "accept_group_invitation" 

  # devise_scope :user do 
  #   match "/groups/:id/invitations/new", :to => "users/invitations#new", :via => "get", :as => "new_group_invitation"
  # end  

  # devise_scope :user do
  #   match "groups/:id/invitations/accept", :to => "users/invitations#edit", :via => "get", :as => "accept_group_invitation"
  # end  

  # devise_scope :user do
  #   match "groups/:id/invitations/create", :to => "users/invitations#create", :via => "post", :as => "create_group_invitation"
  # end

  get "/u" => "user#index", :as => :user_root
  get "/u/edit" => "user#edit"
  post "/u/card" => "user#update_cc"


  match '/:groupname' => "groups#show", :as => 'group/show'
  post '/:groupname/order' => "orders#create", :as => 'create_order'

end