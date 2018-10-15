class ReviewsController < ApplicationController
  before_filter :authorize

  def create

    @product = Product.find(params[:product_id])
    @description = params[:review][:description]
    @rating = params[:review][:rating]
    @review = Review.new(product_id: @product.id, user_id: current_user().id, description: @description, rating: @rating)

    #Whether or not the review saves, return to the product page
    redirect_to @product if @review.save
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Review deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize
    redirect_to '/login' unless current_user
  end
end
