module BizarreCms::Contentable
  extend ActiveSupport::Concern

  included do
    has_one :content, as: :contentable
    accepts_nested_attributes_for :content
    attr_accessible :content_attributes
    validates :content, presence: true
    after_initialize :set_content
  end

  def set_content
    self.content ||= build_content
  end

  def self.content_fields(form, options = {})
    form.inputs name: 'Content', for: :content do |f|
      f.input :summary, as: :text, input_html: { class: 'markitup summary' } unless options[:hide_summary].present? 
      f.input :body, as: :text, input_html: { class: 'markitup' }
      f.input :top_image, as: :file
      f.input :delete_image, as: :boolean
    end
    form.inputs name: 'Meta', id: 'meta', for: :content do |f|
      f.input :meta_desc, as: :text, input_html: { rows: '5' }
      f.input :meta_keywords, as: :text, input_html: { rows: '5' }
      f.input :meta_title
    end
  end
end
