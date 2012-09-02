class CreateBizarreCmsAbstractPages < ActiveRecord::Migration
  def change
    create_table :bizarre_cms_abstract_pages do |t|
      t.string :page_type, null: false
      t.string :title, null: false
      t.string :layout_name, null: false, default: 'application'
      t.string :slug, null: false
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.boolean :published, null: false, default: true

      t.timestamps
    end
  end
end
