class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = current_company.quotes
  end

  def show
  end

  def new
    @quote = Quote.new(company: current_company)
  end

  def create
    @quote = current_company.quotes.new(quote_params)
    unless @quote.save
      render :new, status: :unprocessable_entity and return
    end

    flash_message = "Quote was successfully created."

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: flash_message }
      format.turbo_stream { flash.now[:notice] = flash_message }
    end

  end

  def edit
  end

  def update
    unless @quote.update(quote_params)
      render :edit, status: :unprocessable_entity and return
    end

    flash_message = "Quote updated successful"

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: flash_message }
      format.turbo_stream { flash.now[:notice] = flash_message }
    end

  end

  def destroy
    @quote.destroy

    flash_message = "Quote destroyed successful"

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: flash_message }
      format.turbo_stream { flash.now[:notice] = flash_message }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find_by(id: params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name, :verified)
  end

end
