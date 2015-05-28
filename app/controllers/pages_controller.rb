class PagesController < ApplicationController
    def index
        @pages_learning = Page.where(knowledge: "Learning")
        @pages_learned = Page.where(knowledge: "Learned")
        @page = Page.where(knowledge: 'Learning').first
    end
    
    def new
        @page = Page.new   #note that page is singular
    end
    
    def edit 
      @page = Page.find(params[:id]) 
    end

    def update 
      @page = Page.find(params[:id]) 
      if @page.update_attributes(page_params) 
        redirect_to(:back)
      end
    end
    
    def refresh
      @page = Page.find(params[:id]) 
      @page.update(page_params) 
      redirect_to page_path(@page)
    end
    
    def show
      # if @page.nil?
      #   @page = Page.where(knowledge: 'Learning').first
      # else
      #   @next = Page.where("id > ?", params[:id]).order(:id).first 
      # end
      
      if params[:first] == 'true'
        @page = Page.where(knowledge: 'Learning').first
        # @next = Page.where("id > ?", @page.id).order(:id).first
      else
        @page = Page.where(knowledge: "Learning").where("id > ?", params[:id]).order(:id).first 
        # @next = Page.where("id > ?", @page.id).order(:id).first 
      end
      
    end
    
    
      # @learning ||= []
      # if @learning.empty?
      #   @learning = Page.where(knowledge: 'Learning')
      #   @length = @learning.length
      #   @count = 0
      #   @page = Page.find(@learning[@count])
      #   @count = @count + 1
      # else
      #   if @count == @length
      #     @count = 0
      #     @learning = []
      #     redirect_to '/pages' 
      #   else
      #     @page = Page.find(@learning[@count])
      #     @count = @count + 1
      #   end
      # end
      
      # @page = Page.find(params[:id])
      
      # @page = Page.where(knowledge: 'Learning').first
      # @actual= Page.find(@page.id)
      # redirect_to page_path(@actual)
      # @final = Page.find(params[:id])
      # @page = Page.select(knowledge: 'Learning')
    
      # if @next.nil?
      #   @next = Page.where("id > ?", params[:id]).order(:id).first 
      # end
      # could use the full object instead of params[:id]

      
    
    # def practice
    #   @page = Page.where(knowledge: 'Learning').first
    #   # redirect_to page_path(@page)
    # end
    
          # if @page.id.nil?
    
    # def next_page
    #   # @page = Page.find(params[:id])
    #   def forward
    #     Page.where("knowledge = Learning AND id > ?", id).first
    #   end
    #   @next_page = @page.forward
    # end
    
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      redirect_to pages_path
    end
    
    def create 
      @page = Page.new(page_params)
      @page.define(@page)
      if @page.save 
        redirect_to pages_path
      else 
        render 'new' 
      end 
    end
    
    private 
        def page_params 
          params.require(:page).permit(:word, :content, :knowledge) 
        end
end
