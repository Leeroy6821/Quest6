Rails.application.routes.draw do

  get '/questions', to: 'questions#index'       # localhost/questions

  get '/questions/new', to: 'questions#new'

  root 'pages#index'                             # controller#action

end
