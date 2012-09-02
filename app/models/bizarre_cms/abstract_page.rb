class BizarreCms::AbstractPage < ActiveRecord::Base
  attr_accessible :page_type, :parent_id, :published, :slug, :title, :linked_abstract_page_ids, :layout_name
  include BizarreCms::Contentable

  acts_as_nested_set

  has_many :abstract_page_links, dependent: :destroy
  has_many :linked_abstract_pages, through: :abstract_page_links

  scope :for_link_select, joins(:page_type).order('page_types.title, abstract_pages.title')

  validates :title, uniqueness: [:parent_id], presence: true
  validates :slug, uniqueness: true, presence: true
  validates :page_type, presence: true
  validates :layout_name, presence: true

  # TODO can we remove this method with awesome_nested set builid helper
  def self.parent_collection_for page=nil
    order(:lft).map {|p| ['-- '*p.level + p.title, p.id]}
  end

  def self.tree_children
    roots.map(&:to_tree_children)
  end

  def to_tree_children
    {
      id: self.id,
      label: self.title,
      children: self.children.map(&:to_tree_children)
    }
  end

  # prevent to destroy branch
  before_destroy :leaf?

  #layouts must have *.html.* names
  def self.layout_select
    Dir.glob(File.expand_path('app/views/layouts/**/*.html.*', Rails.root)).map do |filename|
      filename.gsub!("#{File.expand_path('app/views/layouts', Rails.root)}/", '')
      filename.split('/').last[0...1] == '_' ? nil : filename.split('.').first
    end.compact.sort
  end

end
