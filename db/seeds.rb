# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'
require 'faker'

Book.destroy_all
User.destroy_all
Review.destroy_all




def get_books
    google_books = ENV["GOOGLE_API_KEY"]
    index_number = 0
    book_array = []
    40.times do 
        all_books = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=a&orderBy=newest&startIndex=#{index_number}&key=#{google_books}")
        book_hash = JSON.parse(all_books)
        index_number += 1
        book_array << book_hash["items"]
    end
    book_array = book_array.flatten
    
    

    book_array.each do |book|
        #binding.pry
        Book.create(
        title: book["volumeInfo"]["title"],
        subtitle: book["volumeInfo"]["subtitle"],
        author: book["volumeInfo"]["authors"][0],
        image_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
        year: book["volumeInfo"]["publishedDate"],
        description: book["volumeInfo"]["description"],
        genre: book["volumeInfo"]["categories"],
        page_length: book["volumeInfo"]["pageCount"]

        )
    end
end

get_books

User.create(username: "Harry Potter")
User.create(username: "Hermione Granger")
User.create(username: "Ron Weasley")

50.times do 
    Review.create(comment: Faker::Quotes::Shakespeare.as_you_like_it_quote, recommend: true, rating: 4,  book_id: Book.all.sample.id, user_id: User.all.sample.id)
end

