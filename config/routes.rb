Rails.application.routes.draw do
  resources :interests
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'interests#index'
  post 'update_all_answers' => 'interests#update_all_answers', as: :update_all_answers
  post 'update' => 'interests#update', as: :update

  # resources :interests do
  # 	collection do
  # 		get :edit
  # 	end
  # end
end
