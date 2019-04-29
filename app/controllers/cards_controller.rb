class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(@card)
    else
      render 'cards/edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to books_path
  end

  private

  def card_params
    params.require(:card).permit(:category, :title, :author, :publication, :begin, :end, :description, :rating, :cover, :url, :publisher)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
