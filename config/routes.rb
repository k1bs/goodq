Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :comments, only: [:show, :new, :create, :update]
    post '/comments/:id/upvote', to: 'comments#upvote'
  end
end
