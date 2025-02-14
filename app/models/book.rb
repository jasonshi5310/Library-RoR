class Book < ApplicationRecord
    has_many :reviews
    validates:title, presence:true
    validates:author, presence:true
    validates:isbn, presence:true, length: {is:10}, numericality: { only_integer: true , greater_than_or_equal_to: 0}, uniqueness: true
    validates:copies, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0}

    def checkout
        self.copies -= 1
    end
end
