class BooksController < ApplicationController
    def new
        @book = Book.new
    end


    def show
        @book = Book.find(params[:id])
    end

    def index
        @books = Book.all
    end
    

    def create
        # render plain: params[:book].inspect
        @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))

        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end


    def edit
        @book = Book.find(params[:id])
    end


    def update
        # @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))
        @book = Book.find(params[:id])
        if @book.update(params.require(:book).permit(:title, :author, :isbn, :copies))
            redirect_to @book
        else
            render 'edit'
        end
    end

    def checkout
        @book = Book.find(params[:id])
        if @book.copies > 1
            @book.checkout
            @book.save!
            redirect_to books_path
        else
            redirect_to books_path
        end
    end
end
