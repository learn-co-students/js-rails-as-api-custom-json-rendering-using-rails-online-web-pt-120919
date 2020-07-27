Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  # new
  get '/birds/:id' => 'birds#show'
end