class AdventuresController < ApplicationController
	def index
		@adventures = Adventure.all
	end	

	def create
		adventure = Adventure.new adventure_params
		#BELOW IS PROBABLY WRONG!!!!!!!!!!
		adventure.url = SecureRandom.urlsafe_base64(10)
		adventure.save
		redirect_to adventure
	end

	def new
		@adventure = Adventure.new
	end	

	def edit
		@adventure = Adventure.find(params[:id])
	end	

	private
		def adventure_params
			params.require(:adventure).permit(:title, :author, :url)
		end
end
