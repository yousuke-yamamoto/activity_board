Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root 'activities#index'
  resources :activities do
    resources :comments
  end
end
