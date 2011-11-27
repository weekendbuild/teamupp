class UserRequired
  def self.matches?(request)
    request.session[:user_id].present?
  end
end

Teamupp::Application.routes.draw do
  constraints UserRequired do
    root :to => 'teams#index'
    
    resources :teams do
      resources :milestones do
        resources :tasks
      end
    end
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'home#index'
  
end
