class Product < ActiveRecord::Base

	has_attached_file :image, styles: { medium: "150x150>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :name, presence: true
	validates :description, presence: true
 	validates :price, presence: true
 	validates_numericality_of :price

 	self.per_page = 3

 	belongs_to :user

 	def short_description
 		description.length > 130 ? description[0..130] + "..." : description
 	end
 	
end