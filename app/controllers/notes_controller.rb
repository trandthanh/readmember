class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]

  def new
    @card = Card.find(params[:card_id])
    @note = Note.new
  end

  def create
    @card = Card.find(params[:card_id])
    @note = Note.new(note_params)
    @note.card = @card

    if @note.save
      redirect_to card_path(@card)
    else
      render 'notes/new'
    end
  end

  def edit
    # @card = Card.find(params[:card_id])
  end

  def update
    if @note.update(note_params)
      redirect_to card_path(@note.card)
    else
      render 'notes/edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to card_path(@note.card)
  end

  private

  def note_params
    params.require(:note).permit(:page, :quote, :remark)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
