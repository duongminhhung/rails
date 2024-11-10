Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }

    namespace :admin do
      resources :users do
        member do
          post :send_email
        end
      end
      resources :posts
    end

    # Fallback for unmatched routes
    match '*path', to: 'application#not_found', via: :all
  end
end
