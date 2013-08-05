class Product < ActiveRecord::Base

	attr_accessible :name, :description, :photo1, :photo2, :photo3, :photo4, :brand, :productClass, :comment, :subject, :weight
	# attr_protected :id, :salt
	
	validate :name, :presence => true, :uniqueness => {:case_sensitive => false}
	
	attr_accessible :photo1, :photo2, :photo3, :photo4
	
	has_attached_file :photo1, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension", :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename"
	validates_attachment_content_type :photo1, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo1, :less_than => 2.megabytes
	
	has_attached_file :photo2, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension", :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename"
	validates_attachment_content_type :photo2, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo2, :less_than => 2.megabytes
	
	has_attached_file :photo3, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension", :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename"
	validates_attachment_content_type :photo3, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo3, :less_than => 2.megabytes
	
	has_attached_file :photo4, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension", :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename"
	validates_attachment_content_type :photo4, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo4, :less_than => 2.megabytes
	
end
