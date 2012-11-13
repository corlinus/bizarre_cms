module BizarreCms
  class Engine < ::Rails::Engine
    initializer :bizarre_cms do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end
  end
end
