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

end