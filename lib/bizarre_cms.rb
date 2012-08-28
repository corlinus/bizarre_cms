require "bizarre_cms/engine"

module BizarreCms
  class Engine < ::Rails::Engine
    isolate_namespace BizarreCms

    initializer :bizarre_cms do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/bizarre_cms/admin']
    end
  end
end
