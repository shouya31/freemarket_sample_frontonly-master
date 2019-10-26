Rails.application.routes.draw do
  root to: "products#index"
  
  devise_for :users
  
  devise_scope :user do
    resources :user_info_keep,  to: "sessions#user_info_keep",    only: :create,  as: :user_info_keep        
    resources :address,         to: "sessions#address_form_get",  only: :new,     as: :address_form_get
    resources :address,         to: "sessions#address_info_keep", only: :create,  as: :address_info_keep
    resources :credit,          to: "sessions#credit_get",        only: :new,     as: :credit_get
    resources :credit,          to: "sessions#credit_info_keep",  only: :create,  as: :credit_info_keep
  end

  resources :users, only: [:show] do
    member do
      get "likes", "listings", "in_progress", "completed", "purchase", "purchased"
    end
  end
  resources :products, only: [:new, :create, :show] do
    member do
      post "purchase"
    end
  end
end
