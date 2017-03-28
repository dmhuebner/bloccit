class AdvertisementsController < ApplicationController
	def index
		@advertisements = Advertisement.all
	end

	def show
		@advertisement = Advertisement.find(params[:id])
	end

	def new
		@advertisement = Advertisement.new
	end

	def create
		@advertisement = Advertisement.new
		@advertisement.title = params[:advertisement][:title]
		@advertisement.body = params[:advertisement][:body]
		@advertisement.price = params[:advertisement][:price]

		if @advertisement.save
			flash[:notice] = "Ad has been saved succesfully!"
			redirect_to @advertisement
		else
			flash[:alert] = "There was an error saving your ad. Please try again."
			render :new
		end
	end
end
