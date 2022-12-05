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
    render :new and return unless @quote.save

    redirect_to quotes_path, notice: "Quote created successful"
  end

  def edit
  end

  def update
    render :edit and return unless @quote.update(quote_params)
    redirect_to quotes_path, notice: "Quote updated successful"
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote destroyed successful"
  end

  private

  def set_quote
    @quote = Quote.find_by(id: params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end

end
