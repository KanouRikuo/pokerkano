Rails.application.routes.draw do

  get "/" => "posts#index"
  post "/" => "posts#complete"

end