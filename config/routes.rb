Rails.application.routes.draw do
  resources :profiles
    root to: "patients#index"
  devise_for :users
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  get 'requests/edit'

    resources :patients do
        #this is tied in with the one-to-many relationship defined in the patient.rb file
        resources :requests
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get '/signedinuserprofile' => 'profiles#signedinuserprofile'
    
end
