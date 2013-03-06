JaneslunchCom::Application.routes.draw do

  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  root :to => "site#index"

  resources :groups

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

  get '/:groupname' => "groups#show", :as => 'group/show'

end
