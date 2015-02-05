Rails.application.routes.draw do

  resources :candidates, only: [:index, :new, :create, :show]
  get 'pspost', to: 's3#new'
  get 'thankyou', to: 'welcome#thankyou'
  root 'welcome#index'

end
