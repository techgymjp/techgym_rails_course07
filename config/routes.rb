Rails.application.routes.draw do
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

    resources :products
  end
end
