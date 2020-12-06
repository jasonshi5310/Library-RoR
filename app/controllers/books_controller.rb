class BooksController < ApplicationController
    def new
        @book = Book.new
    end


    def show
        @book = Book.find(params[:id])
        psid = params[:ps_id]
        return @book, psid
    end

    def index
        @books = Book.all
    end
    

    def create
        # render plain: params[:book].inspect
        @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))

        if @book.save
            redirect_to administrator_index_path
        else
            render 'new'
        end
    end


    def edit
        @book = Book.find(params[:id])
        return @book, params[:as_id]
    end


    def update
        @book = Book.find(params[:id])
        asid = params[:book][:as_id]
        if @book.update(params.require(:book).permit(:title, :author, :isbn, :copies))
            redirect_to admin_search_path(:action=>"show", :controller=>"admin_searches", id: asid)
        else
            # render 'edit'
            flash[:notice] = "Some inputs are incorrect! The values are set back to the original ones!"
            redirect_to edit_book_path(id: params[:id], as_id: asid)
        end
    end

    def checkout
        @book = Book.find(params[:id])
        if @book.copies > 0
            @book.checkout
            @book.save!
            redirect_to admin_search_path(:action=>"show", :controller=>"admin_searches", id: params[:as_id])
        else
            redirect_to admin_search_path(:action=>"show", :controller=>"admin_searches", id: params[:as_id])
            flash.alert = "No More Copies For that book"
        end
    end
end
