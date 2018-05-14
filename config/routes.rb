Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show] do
    resources :users, only: [:index]
    resources :stories, only: [:new, :create, :index, :show, :update]
    resources :project_members, only: [:new, :create, :destroy] do
      collection do
        post 'confirm'
      end
    end
  end
  devise_for :users
  root 'home#home'
end
