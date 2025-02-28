class ArticlesController < ApplicationController

  def index
    @articles = Article.order(published_at: :desc)
    render json: @articles, status: :ok
  end

  def create
    begin
     article = Article.create(article_params) 
     if !article.save
      render status: :error 
     end
     render  json: article, status: :created
    rescue Exception => e
      render status: :unprocessable_entity
    end
  end

  def show
    begin
    article = Article.find(params[:id])
    if article.present?
      render json: article
    else
      render  status: :not_found
    end
  rescue ActiveRecord::RecordNotFound => e
    render status: :not_found
  end
  end

  def not_allowed
    render status: :method_not_allowed
  end


  private
  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
