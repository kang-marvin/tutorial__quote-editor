class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    unless @quote.save
      render :new, status: :unprocessable_entity and return
    end

    redirect_to quotes_path, notice: "Quote created successful"
  end

  def edit
  end

  def update
    unless @quote.update(quote_params)
      render :edit, status: :unprocessable_entity and return
    end
    redirect_to quotes_path, notice: "Quote updated successful"
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote destroyed successful" }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find_by(id: params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name, :verified)
  end

end
