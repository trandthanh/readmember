class CardsController < ApplicationController
  def index


  end

  def books
    @book_cards = Card.where(category: "Book")
  end

  def new

  end

  def show

  end
end
