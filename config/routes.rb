Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/offices', to: 'offices#index'
  get '/offices/:id', to: 'offices#show'

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'

  get '/programs', to: 'programs#index'
  get '/programs/:id', to: 'programs#show'
end
