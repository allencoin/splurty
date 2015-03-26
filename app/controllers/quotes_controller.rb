class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

	def new
		@quote = Quote.new
	end

	def create
		@quote = Quote.create(quote_params)
		if @quote.invalid?
			flash[:error] = '<strong>Naw...</strong> Make your quote between 3 and 140 characters. Just like twitter.<br>And make sure you spelled their name right. Don\'t be disrespectful.'
		end
		redirect_to root_path
	end

	def about
	end

	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end
end