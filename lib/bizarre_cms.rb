require "bizarre_cms/engine"
require "bizarre_cms/contentable"
require "bizarre_cms/helpers"

module BizarreCms
  class Engine < ::Rails::Engine
    isolate_namespace BizarreCms

    initializer :bizarre_cms do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/bizarre_cms/admin']
    end
  end

  mattr_accessor :custom_pages
  @@custom_pages ||= []

  mattr_accessor :available_layouts
  @@available_layouts ||= []

  # Setup BizarreCms. Run rails generate bizarre_cms:install.
  def self.setup
    yield self
  end

  def self.page_types
    [:page] + @@custom_pages
  end

end
