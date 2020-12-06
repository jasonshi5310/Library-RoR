class PatronSearch < ApplicationRecord
    def patron_search
        books = Book.all
        if title == '' and author == '' and isbn == ''
            return []
        end
        books=books.where("Title LIKE ? and Author Like ? and ISBN LIKE ?",
            "%#{title}%", "%#{author}%", "%#{isbn}%")
        return books
    end
end
