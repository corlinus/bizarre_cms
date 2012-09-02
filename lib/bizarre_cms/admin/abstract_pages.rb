if defined?(ActiveAdmin)
  ActiveAdmin.register BizarreCms::AbstractPage do
    menu priority: 1

    before_filter { @skip_sidebar = true }
    index download_links: false do
      div do
        render 'admin/abstract_pages/index'
      end
    end

    form do |f|
      f.inputs do
        f.input :parent, collection: BizarreCms::AbstractPage.parent_collection_for(f.object)
        f.input :page_type, collection: BizarreCms.page_types, include_blank: false
        f.input :layout_name, collection: BizarreCms::AbstractPage.layout_select, include_blank: false
        f.input :title
        f.input :slug
        #FIXME move to model-layer
        f.input :published, input_html: { checked: 'checked' } 
      end
      #
      #TODO add :except method
      BizarreCms::Contentable.content_fields(f, hide_summary: true)
      f.buttons
    end

    show do |abstract_page|
      attributes_table do
        row :id
        row :page_type
        row :title
        row :parent
        row :published
        row :created_at
        row :updated_at
      end

      active_admin_comments
    end

    collection_action :move, method: :post do
      page = BizarreCms::AbstractPage.find params[:page_id]
      target_page = BizarreCms::AbstractPage.find params[:target_page_id]

      case params[:position]
      when 'inside'
        page.move_to_child_with_index target_page, 0
        render text: 'true', status: 200 and return
      when 'after'
        page.move_to_right_of target_page
        render text: 'true', status: 200 and return
      end
      render status: 500
    end
  end
end
