Dummy::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get "home/index"
  root to: 'home#index'

  mount BizarreCms::Engine, at: 'cms'

end
