class BizarreCms::PagesController < ApplicationController
  def index
    @page = BizarreCms::AbstractPage.published.find_by_slug params[:id]
    raise ActiveRecord::RecordNotFound, "Couldn't find AbstractPage with slug=#{params[:id]}" unless @page
  end
end
