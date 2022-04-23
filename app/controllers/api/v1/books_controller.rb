module Api
  module V1
    class BooksController < ApplicationController
      # Indexing all Books
      def index
        books = Book.order('created_at DESC');
        render json: { status: 'SUCCESS', message:'Loaded Books', data:books },status: :ok
      end
      # Show Only 1 Book based on params
      def show
        book = Book.find(params[:id])
        render json: { status: 'SUCCESS', message:'Loaded Book', data:book },status: :ok
      end

      def create
        book = Book.new(book_params)

        if book.save
          render json: { status: 'SUCCESS', message:'Book Created', data:book },status: :ok
        else
          render json: { status: 'ERROR', message:'Book Not Created', data:book.errors },status: :unprocessable_entity
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: { status: 'SUCCESS', message:'Book Deleted', data:book },status: :ok
      end

      private
      def book_params
        params.permit(:title, :body, :author)
      end
    end
  end
end
