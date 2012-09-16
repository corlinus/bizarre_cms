class BizarreCms::AbstractPage < ActiveRecord::Base
  attr_accessible :page_type, :parent_id, :published, :slug, :title, :linked_abstract_page_ids, :layout_name
  include BizarreCms::Contentable

  acts_as_nested_set

  validates :title, uniqueness: [:parent_id], presence: true
  validates :slug, uniqueness: true, presence: true
  validates :page_type, presence: true
  validates :layout_name, presence: true

  after_initialize :set_defaults

  scope :published, where(published: true)

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

  def body
    self.content.to_html(:body)
  end

  def summary
    content.to_html(:summary)
  end

  private

  def set_defaults
    self.published = true if self.published.nil?
  end
end
