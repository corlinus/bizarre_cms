class BizarreCms::PagesController < ApplicationController
  def index
    @page = BizarreCms::AbstractPage.find_by_slug params[:id]
    raise ActiveRecord::RecordNotFound, "Couldn't find AbstractPage with slug=#{params[:id]}" unless @page
  end

  private

  def page_path page
    BizarreCms::Helpers.page_path page
  end

  helper_method :page_path
end
