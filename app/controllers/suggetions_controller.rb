class SuggetionsController < ApplicationController

	def create
		suggetion = Suggetion.find_or_initialize_by(suggetion_params)
		suggetion.count += 1
		suggetion.save
		respond_to do |format|
      format.js
    end
	end

	private
    def suggetion_params
      params.require(:suggetion).permit(:name, :suggetion_type)
    end
end
