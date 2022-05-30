Rails.application.routes.draw do
  # controller#action
  # localhost/questions

  get '/questions', to: 'questions#index'

  root 'pages#index'
end
