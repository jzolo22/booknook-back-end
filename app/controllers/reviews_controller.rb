class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end


    def update
        review = Review.find(params[:id])
        review.update!(comment: params[:comment], recommend: params[:recommend], rating: params[:rating])
        render json: review
    end


    def create 
        review = Review.create!(review_params)
        render json: review
    end

    private

    def review_params
        params.permit(:comment, :recommend, :rating, :book_id, :user_id)
    end
end
