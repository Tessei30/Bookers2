Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  	get 'user/sign_up' => 'devise/registrations#new'
  end

  get '/home/about' => 'homes#about'

  root :to => 'homes#top'

	resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
	resources :book_images, only:[:new, :create, :index, :show]
  
end
