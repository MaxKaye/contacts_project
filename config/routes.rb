Rails.application.routes.draw do
  root to: 'people#index'

  resources :people do
    resources :contacts
  end

    # # people routes
    # get     '/people',          to: 'people#index'
    # get     '/people/new',      to: 'people#new'
    # post    '/people',          to: 'people#create'
    #
    # get     '/people/:id',      to: 'people#show'
    # get     '/people/:id/edit', to: 'people#edit'
    # put     '/people/:id',      to: 'people#update'
    # delete  '/people/:id',      to: 'people#destroy'

    # contacts routes
    # get     '/contacts',          to: 'contacts#index'
    # get     '/contacts/new',      to: 'contacts#new'
    # post    '/contacts',          to: 'contacts#create'
    #
    # get     '/contacts/:id',      to: 'contacts#show'
    # get     '/contacts/:id/edit', to: 'contacts#edit'
    # put     '/contacts/:id',      to: 'contacts#update'
    # delete  '/contacts/:id',      to: 'contacts#destroy'
end
