Rails.application.routes.draw do
  get '/pages/:id' => 'bizarre_cms/pages#index'

  BizarreCms.custom_pages.each do |type|
    get "/#{type}_pages/:id" => "#{type}#index"
    resources type, only: :show
  end
end
