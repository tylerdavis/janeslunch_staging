JaneslunchCom::Application.routes.draw do

  root :to => "site#index"
  
  resources :user

  resources :groups
  
  resources :items

  resources :ordr_accounts
  
  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  devise_scope :user do 
    match "/groups/:id/invitations/new", :to => "users/invitations#new", :via => "get", :as => "new_group_invitation"
  end  

  devise_scope :user do
    match "groups/:id/invitations/accept", :to => "users/invitations#edit", :via => "get", :as => "accept_group_invitation"
  end  

  devise_scope :user do
    match "groups/:id/invitations/create", :to => "users/invitations#create", :via => "post", :as => "create_group_invitation"
  end

  get "/u" => "user#index", :as => :user_root
  get "/u/edit" => "user#edit"
  post "/u/card" => "user#update_cc"


  match '/:groupname' => "groups#show", :as => 'group/show'
  post '/:groupname/order' => "orders#create", :as => 'create_order'

end