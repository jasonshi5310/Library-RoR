class BooksController < ApplicationController
    def new
        # @book = Book.new
    end
    

    def create
        render plain: params[:book].inspect
    end
end
