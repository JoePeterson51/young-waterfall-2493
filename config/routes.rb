Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/studios/:id', to: 'studios#show'
end

