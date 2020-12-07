class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @book = Book.find(params[:book_id])
        reviewer = params[:review][:reviewer]
        body = params[:review][:body]
        @review = @book.reviews.create(params.require(:review).permit(:reviewer, :body))
        flash[:notice] = 'Successfully added a review!'
        psid = params[:review][:ps_id]
        # redirect_to patron_search_path(:action=>"show", :controller=>"patron_searches", id: psid)
        redirect_to book_path(:action=>"show", id: params[:book_id], ps_id: psid)
    end
end
