require "bizarre_cms/engine"
require "bizarre_cms/contentable"

module BizarreCms
  mattr_accessor :custom_pages
  @@custom_pages ||= []

  # Setup BizarreCms. Run rails generate bizarre_cms_install.
  def self.setup
    yield self
  end

  def self.page_types
    [:page] + @@custom_pages
  end
end
