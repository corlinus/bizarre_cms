Dummy::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get "home/index"
  root to: 'home#index'

end
