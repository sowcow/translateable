class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @q = Text.search params[:q]
    @texts = @q.result distinct: true
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end

  # GET /texts/new
  def new
    @text = params[:text] ? Text.new(text_params) : Text.new
    @texts = @text.arrange_as_array
  end

  # GET /texts/1/edit
  def edit
    @texts = @text.arrange_as_array
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render action: 'show', status: :created, location: @text }
      else
        format.html { render action: 'new' }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    redirect_to @text, notice: 'nope...'
    #parent = @text.parent
    #@text.destroy
    #respond_to do |format|
    #  format.html { redirect_to parent || texts_url }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:title, :body, :parent_id)
    end
end
