class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    render json: {
        status: 200, message: 'Article was successfully destroyed.'
        }, status: 200 
    #respond_to do |format|
    #  format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    #  format.json { render json: {
    #   status: 200, message: 'Article was successfully destroyed.'
    #   }, status: 200 
    #  }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article not found' }
        format.json { render json: {
          error: 400, message: "article does not exist"
          }, status: 400
        }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      p "running the article_params to make sure this is safe!"
      params.require(:article).permit(:title, :description)
    end
end
