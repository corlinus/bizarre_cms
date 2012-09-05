class BizarreCms::PagesController < ApplicationController
  def index
    @page = BizarreCms::AbstractPage.published.find_by_slug params[:id]
    raise ActiveRecord::RecordNotFound, "Couldn't find AbstractPage with slug=#{params[:id]}" unless @page
    render layout: @page.layout_name
  end

  private

  def page_path page
    BizarreCms::Helpers.page_path page
  end

  helper_method :page_path
end
