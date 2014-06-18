class ArticlesController < ApplicationController
  def index
    #@articles = Article.all
    #@posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    @articles = Article.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: "Article was destroyed."
  end
end
