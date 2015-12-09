class Page < ActiveRecord::Base
  require 'open-uri'
  require 'nokogiri'
  include RankedModel
  ranks :row_order
  validates :word, presence: true, uniqueness: true
  
  def define (entry)
    # get_word = Page.find_by(word: entry.word)
    url = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/" + entry.word + "?key=68deb434-d334-44ef-9429-3f051a3a5fbd"
    doc = Nokogiri::HTML(open(url))
    definition = doc.css("dt")
    final_def = ""
    definition.each do |x|
    	x = x.to_s
    	num = x.index("<", 4)
    	final_def = final_def + "; " + x.slice(5..num-1)
	  end
	  entry.content = final_def.slice(1..-1)
	  entry.save
  end

end
