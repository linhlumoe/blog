class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(30)
  end

  def list
    @articles = Article.includes(:user).published_status
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path, notice: 'Created article successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: 'Updated article successfully.'
    else
      render :edit
    end
  end

  def show
    @articles = Article.published_status.where.not(id: @article.id).limit(7)
    @comments = Comment.where(article_id: params[:id])
    @comment = Comment.new(article_id: @article.id)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, alert: 'Deleted article successfully.'
  end

  private
    def article_params
      params.require(:article).permit(:title, :summary, :content, :status)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
