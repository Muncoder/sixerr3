class ReviewsController < ApplicationController

	def create
		@review = Review.create(review_params)
		@product = @review.product
		if @review.save
			flash[:notice] = "Review saved successfully!"
			redirect_to @product
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@product = @review.product
		@review.delete
		redirect_to @product
	end

	private

	def review_params
		params.require(:review).permit(:user_id, :product_id, :star, :comment)
	end

end