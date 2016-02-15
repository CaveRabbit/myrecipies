Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home' , to: 'pages#home'
  
  #get '/recipes', to: 'receipes#index'
  #get'/recipes/new', to: 'recipes#new', as: 'new_recipe'
  #post '/recipes', to: 'recipes#create'
  #get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  #patch '/recipes/:id', to: 'recipes#update'
  #get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  #delete '/recipes/:id', to: 'recipes#destroy'
  
  resources :recipes do
    #/recipes/2/like This is what the next one is routing to.
    member do
      post 'like'
    end
  end
    
  resources :chefs
  
   
end
