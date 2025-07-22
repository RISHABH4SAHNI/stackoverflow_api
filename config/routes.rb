Rails.application.routes.draw do
  resources :questions, only: [:index, :create] do
    member do
      post :upvote
    end

    resources :answers, only: [:index, :create]
  end

  resources :answers, only: [] do
    member do
      post :upvote
    end
  end
end
