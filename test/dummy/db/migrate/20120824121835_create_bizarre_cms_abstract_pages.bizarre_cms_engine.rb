# This migration comes from bizarre_cms_engine (originally 20120824120326)
class CreateBizarreCmsAbstractPages < ActiveRecord::Migration
  def change
    create_table :bizarre_cms_abstract_pages do |t|
      t.string :page_type
      t.string :title
      t.string :slug
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.boolean :published

      t.timestamps
    end
  end
end
