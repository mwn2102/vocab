class PagesController < ApplicationController
  
    def index
        # @pages_learning = Page.where(knowledge: "Learning")
        # @pages_learning = Page.where(knowledge: "Learning").order(:row_order)
        @pages_learning = Page.where(knowledge: "Learning").rank(:row_order).all
        @pages_learned = Page.where(knowledge: "Learned")
        @page = Page.where(knowledge: 'Learning').first
    end
    
    def update_row_order
        @word = Page.find(word_params[:word_id])
        @word.row_order = word_params[:row_order_position] #row_order_position?
        @word.save
        render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end
    
    def new
        @page = Page.new
    end
    
    def edit 
      @page = Page.find(params[:id]) 
    end

    def update 
      @page = Page.find(params[:id]) 
      @page.update_attributes(page_params) 
      respond_to do |format|
        format.html {redirect_to(:back)}
        format.js 
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
        
        def word_params
          params.require(:page).permit(:word_id, :row_order_position)
        end
end
