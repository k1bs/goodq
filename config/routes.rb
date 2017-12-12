Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'questions#index'
  resources :questions, except: [:edit] do
    resources :comments, only: [:new, :create, :destroy] do
      post '/upvote', to: 'comments#upvote', as: 'upvote'
      post '/downvote', to: 'comments#downvote', as: 'downvote'
    end
  end
end
