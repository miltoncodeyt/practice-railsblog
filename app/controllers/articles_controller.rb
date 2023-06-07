class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :update, :destroy]

  # Path: app/views/articles/index.html.erb
  def index
    @articles = Article.all
  end
  # Path: app/views/articles/show.html.erb
  # def show
  #   @article = Article.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to root_path
  # end
  def show
  end

  # Path: app/views/articles/new.html.erb
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Path: app/views/articles/edit.html.erb
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @article.destroy
    redirect_to root_path
  end 

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end
end
