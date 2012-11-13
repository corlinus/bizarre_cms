module BizarreCms::AbstractPagesHelper
  def page_path page
    case page.page_type
    when 'page'
      "/pages/#{page.slug}"
    else
      "/#{page.page_type}_pages/#{page.slug}"
    end
  end
end
