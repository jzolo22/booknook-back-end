class BooksController < ApplicationController

    def show
        book = Book.find(params[:id])
        render json: book
    end

    def index
        books = Book.all
        shuffled_books = books.uniq do |book|
            [
                book[:title]
            ]
        end.shuffle
        render json: shuffled_books
    end

    def create
        book = Book.create!(book_params)
        render json: book
    end

    def update
        book = Book.find(params[:id])
        book.update!(title: params[:title], author: params[:author], genre: params[:genre], image_url: params[:image_url], year: params[:year], description: params[:description] )
        render json: book 
    end
    
    private

    def book_params
        params.permit(:title, :author, :genre, :image_url, :year, :description)
    end

end