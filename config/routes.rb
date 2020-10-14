Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'recipes#index'
  resources :recipes do
    resources :ingredients
    resources :tags
  end

  resources :ingredients do
    resources :recipes
  end

  resources :tags do
    resources :recipes
  end
end
