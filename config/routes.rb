Rails.application.routes.draw do
  resources :posts do
    get :create_comment
  end

  resources :comments

  devise_for :users , :controllers => {registrations: 'registrations'}

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  root 'posts#index'
end
