class ArticlesController < ApplicationController

  def index
    @articles = Article.order(published_at: :desc)
    render json: @articles, status: :ok
  end

  def create
    begin
   @article = Article.create!(article_params) 
   if @article.save
    render json: @article, status: :created
   else
    render json: {errors: @article.errors }, status: :error
   end
  rescue Exception => e
    render json: { errors: e}, status: :bad_request
  end
end

  def show
    @article = Article.find_by_id(params[:id])
    if @article.present?
      render json: @article
    else
      render  status: :not_found
    end
  end

  def not_allowed
    render status: :method_not_allowed
  end


  private
  def article_params
    params.require(:article).permit(:title, :content, :author, :category, :published_at)
  end
end
