Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/about', { to: 'about#index'} )

  get('/contact', {to: 'contact#index'})

  post('/contact', {to: 'contact#create', as: 'contact_submit'})

  # get('/products/new', { to: 'products#new', as: 'new_product' })
  # post('/products', { to: 'products#create', as: 'products' })
  #
  # get('/products/:id', { to: 'products#show', as: 'product' })
  #
  #
  # get('/products', { to: 'products#index' })
  #
  # get('/products/:id/edit', { to: 'products#edit', as: 'edit_product' })
  #
  # patch('/products/:id', { to: 'products#update' })
  #
  # delete('/products/:id', { to: 'products#destroy' })

  resources :products do
    resources :reviews
  end

  root 'welcome#index'
 end
