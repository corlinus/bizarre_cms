module BizarreCms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc 'Create a BizarreCms initializer.'

      def copy_initializer
        template 'bizarre_cms.rb', 'config/initializers/bizarre_cms.rb'
      end
    end
  end
end
