class CreateBizarreCmsContents < ActiveRecord::Migration
  def change
    create_table :bizarre_cms_contents do |t|
      t.text     "summary"
      t.text     "body"
      t.string   "meta_title"
      t.text     "meta_desc"
      t.text     "meta_keywords"
      t.integer  "contentable_id"
      t.string   "contentable_type"
      t.string   "top_image_file_name"
      t.string   "top_image_content_type"
      t.integer  "top_image_file_size"
      t.datetime "top_image_updated_at"

      t.timestamps
    end
  end
end
