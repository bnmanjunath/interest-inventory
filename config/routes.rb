Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'interests#show'
  #post 'update_all_answers' => 'interests#update_all_answers', as: :update_all_answers
  post 'update' => 'interests#update', as: :update
  #ost 'edit' => 'interests#edit', as: :edit
  match 'interests/all/edit_all' => 'interests#edit_all', :as => :edit_all, :via => :get
  match 'interests/all' => 'interests#update_all_answers', :as => :update_all_answers, :via => :put
  resources :interests
  devise_for :users
  # resources :interests do
  # 	collection do
  # 		get :edit
  # 	end
  # end
end
