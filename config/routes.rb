Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/offices', to: 'offices#index'
  get '/offices/new', to: 'offices#new'
  post '/offices', to: 'offices#create'
  get '/offices/:id', to: 'offices#show'



  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'

  get '/programs', to: 'programs#index'
  get '/programs/:id', to: 'programs#show'

  get '/offices/:id/trails', to: 'offices#index', as: 'office_trails'
  get '/parks/:id/programs', to: 'programs#index', as: 'park_programs'
end
