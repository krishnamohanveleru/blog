class CommentsController < ApplicationController

  before_action :fetch_article

  def new
    @comment = Comment.new
  end

  def create
    if @article.comments.create!(comment_params)
      redirect_to @article
    else
      render 'new'
    end
  end 

  def edit
      #@article.
      @comment = Comment.find(params[:id])
  end
         
  
  def update


      #@article.
      @comment = Comment.find(params[:id])
         


      if @article.comments.update(comment_params)
        redirect_to @article
      else 

        logger.debug @article.errors
     end  


  end


   def destroy
  @article.comment.destroy if @article.comment

  redirect_to article_comment_path
   end
  

  

  private 

    def fetch_article
      @article = Article.find(params[:article_id])
    end	

    def comment_params
      params.require(:comment).permit(:heading, :body)
    end

    
end
