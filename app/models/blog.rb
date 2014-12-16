class Blog < ActiveRecord::Base
	validates_presence_of :feed

	before_save do
		doc = Nokogiri::XML(open("#{self.feed}"))
		self.title = doc.xpath("//channel/title").text
	end
end
