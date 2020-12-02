class ReviewsController < ApplicationController


    def update
        review = Review.find(params[:id])
        review.update!(comment: params[:comment], recommend: params[:recommend], rating: params[:rating], book_id: params[:book_id], user_id: params[:user_id])


    def create 
        review = Review.create!(review_params)
        render json: review
    end

    private

    def review_params
        params.permit(:comment, :recommend, :rating, :book_id, :user_id)
    end
end
