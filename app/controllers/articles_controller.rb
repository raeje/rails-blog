class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
    puts ">>>>>>>>>edit #{@article.id}"
    render :edit
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    puts ">>>>>>>>>delete #{@article.id}"
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    puts ">>>>>>>>>show #{@article.id}"
    #render :show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      #render :show, status: :ok, location: @article
      redirect_to articles_path(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:name, :body)
  end
end