Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/about', { to: 'about#index'} )

  get('/contact', {to: 'contact#index'})

  post('/contact', {to: 'contact#create', as: 'contact_submit'})



  root 'welcome#index'
 end