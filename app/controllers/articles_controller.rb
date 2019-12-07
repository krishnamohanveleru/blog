class ArticlesController < ApplicationController
 before_action :find_article, only: [:edit,:update]


   

	def index
    @articles = Article.includes(:comments).article_created_at
   #@articles= Article.all
  end
  
  def new 
  	@article = Article.new
  end
 
  def create 
       @article = Article.new(article_params)
        if    @article.save
        	flash.now[:info]= 'Article crteated'

        	redirect_to @article
          else 
          	logger.debug 'KRISHNA MOHAN'

          logger.debug @article.erros#.full_messages
          	flash[info]="faile to save"
          	render 'new'
        end
  end
  
  def edit 
      #@article = Article.find(params[:id])

     end
  
    def update


      #@article = Article.find(params[:id])
         


      if @article.update(article_params)
      	redirect_to @article
      else 

      	logger.debug @article.errors
     end 	


  end



  def show
    #logger.debug params.inspect
    #@article=Article.find(params[:id])
    @article = Article.includes(:comments).find(params[:id])
  end

  

  

#def destroy
  #@article.destroy if @article

 # redirect_to article_path
#end
  
   
  private 



  def find_article
    @article = Article.find(params[:id])

   end
   def article_params
   	params.require(:article).permit(:headline ,:summary, :conclusion, :ticker ,:body)
   end
end
