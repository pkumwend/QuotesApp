class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:new, :create, :show, :index]

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.where(is_public: true) 
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    8.times { @quote.category_quotes.build }
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @quote.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
=begin

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: "Quote was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @quote.errors, status: :unprocessable_content }
      end
    end
  end
=end
  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: "Quote successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end  


# DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy!

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:text, :pub_year, :comment, :source_id, :is_public,:user_id, category_quotes_attributes: [:id, :category_id, :_destroy])

    end
end