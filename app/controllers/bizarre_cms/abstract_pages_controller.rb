class BizarreCms::AbstractPagesController < ApplicationController
  def index
    @page = AbstractPage.find_by_slug params[:id]
    @pare || raise ActiveRecord::RecordNotFound, "Couldn't find AbstractPage with slug=#{params[:id]}"
  end
end
