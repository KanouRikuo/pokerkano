Rails.application.routes.draw do

  get "/" => "posts#index"
  post "/" => "posts#complete"

   #app/apis/api.rbをマウント
  # mount API::Root => '/api'
  mount API::Base => '/'
  # namespace :api, {format: 'json'} do
  #   namespace :ver1 do
  #     namespace :users do
  #       get "cards/check" , :action => "new"
  #       post "cards/check", :action => "create"
  #     end
  #   end
  # end

end