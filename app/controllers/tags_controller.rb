class TagsController < ApplicationController

	def index
    respond_to do |format|
      format.json{ render :json => tag_tokens(params[:q]) }
    end
  end

end
