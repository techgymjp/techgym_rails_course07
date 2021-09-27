Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :show] do
    resources :evaluations, only: [:create]
  end

  namespace :admin do
    devise_for :admin_users,
               only: [:sessions],
               controllers: {
                 sessions: 'admin/admin_users/sessions',
               }

    resources :admin_users

    resources :categories do
      resources :products, only: [:index]
    end

    resources :products do
      resources :copied_products, only: [:new, :create], module: 'products'

      resources :evaluations, only: [:destroy]
    end
  end
end
