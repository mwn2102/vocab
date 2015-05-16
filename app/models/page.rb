class Page < ActiveRecord::Base
  # def forward
  #   self.class.where("knowledge = Learning AND id > ?", id).first
  # end
  
# def next_post
#   self.class.first(:conditions => ["knowledge > ?", knowledge], :order => "knowledge asc")
# end

  # @apple = Page.where(knowledge: 'Learning').first

end
