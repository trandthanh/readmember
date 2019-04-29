class CardsController < ApplicationController
  def index
  end

  def books
    @book_cards = Card.where(category: "Book", user_id: current_user)
  end

  def new
    @user = current_user
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @user = current_user
    @card.user = @user
    if @card.save
      redirect_to :controller => 'cards', :action => "#{@card.category.downcase}s"
    else
      render 'cards/new'
    end
  end

  def show

  end

  private

  def card_params
    params.require(:card).permit(:category, :title, :author, :publication, :begin, :end, :description, :rating, :cover, :url, :publisher)
  end
end
