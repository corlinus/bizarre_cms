Rails.application.routes.draw do
  get '/pages/:id' => 'bizarre_cms/pages#index'
end
