Teamupp::Application.routes.draw do
  
  resources :teams

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'home#index'
  
end
