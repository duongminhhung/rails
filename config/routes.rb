Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }
  namespace :admin do
    resources :users
    resources :posts
  end
  get '/', to: 'admin/posts#test123'
  match '*path', to: 'application#not_found', via: :all
end
