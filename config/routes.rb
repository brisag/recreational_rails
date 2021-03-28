Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/offices', to: 'offices#index'
  get '/offices/new', to: 'offices#new'
  post '/offices', to: 'offices#create'
  get '/offices/:id', to: 'offices#show'
  get '/offices/:id/edit', to: 'offices#edit'
  patch '/offices/:id', to: 'offices#update'

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/trails/:id/edit', to: 'trails#edit'
  patch '/trails/:id', to: 'trails#update'

  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  post '/parks', to: 'parks#create'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'

  get '/programs', to: 'programs#index'
  get '/programs/:id', to: 'programs#show'
  get '/programs/:id/edit', to: 'programs#edit'
  patch '/programs/:id', to: 'programs#update'

  #parent_child
  get '/offices/:id/trails', to: 'office_trails#index'
  get '/offices/:id/trails/new', to: 'office_trails#new'
  post '/offices/:id/trails', to: 'office_trails#create'
  get '/offices/:id/trails_abc', to: 'office_trails#index_abc'

  #parent_child
  get '/parks/:id/programs', to: 'park_programs#index'
  get '/parks/:id/programs/new', to: 'park_programs#new'
  post '/parks/:id/programs', to: 'park_programs#create'
  get '/parks/:id/programs_abc', to: 'park_programs#index_abc'

end
