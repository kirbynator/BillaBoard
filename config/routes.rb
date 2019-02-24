Rails.application.routes.draw do
  root 'charts#index'
  resources :admins
    resources :charts
  resources :artists do
    resources :songs
  end
end

