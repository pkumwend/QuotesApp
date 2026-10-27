class CategoryQuotesController < ApplicationController
  before_action :set_categoryquote, only: %i[ show edit update destroy ]

  # GET /categoryquotes or /categoryquotes.json
  def index
    @categoryquotes = CategoryQuote.all
  end

  # GET /categoryquotes/1 or /categoryquotes/1.json
  def show
  end

  # GET /categoryquotes/new
  def new
    @categoryquote = CategoryQuote.new
  end

  # GET /categoryquotes/1/edit
  def edit
  end

  # POST /categoryquotes or /categoryquotes.json
  def create
    @categoryquote = CategoryQuote.new(categoryquote_params)

    respond_to do |format|
      if @categoryquote.save
        format.html { redirect_to @categoryquote, notice: "Categoryquote was successfully created." }
        format.json { render :show, status: :created, location: @categoryquote }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @categoryquote.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /categoryquotes/1 or /categoryquotes/1.json
  def update
    respond_to do |format|
      if @categoryquote.update(categoryquote_params)
        format.html { redirect_to @categoryquote, notice: "Categoryquote was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @categoryquote }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @categoryquote.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /categoryquotes/1 or /categoryquotes/1.json
  def destroy
    @categoryquote.destroy!

    respond_to do |format|
      format.html { redirect_to categoryquotes_path, notice: "Categoryquote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoryquote
      @categoryquote = CategoryQuote.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def categoryquote_params
      params.expect(categoryquote: [ :quote_id, :category_id ])
    end
end
