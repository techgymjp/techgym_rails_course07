Rails.application.routes.draw do
  # root 'products#index'

  resources :categories, only: [] do
    resources :products, only: [:index]
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
  end
end
