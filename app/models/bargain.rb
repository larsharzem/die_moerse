class Bargain < ActiveRecord::Base
	# bargin status: 0 = proposed, -1 = denied, 1 = accepted
	
	VORGESCHLAGEN = 0
	ABGELEHNT = -1
	AKZEPTIERT = 1
	
	validates_presence_of :product1id
	validates :product1quantity, :numericality => { :only_integer => true, :greater_than => 0 }
	validates_presence_of :product2id
	validates :product2quantity, :numericality => { :only_integer => true, :greater_than => 0 }
	
	attr_accessible :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7, :photo8, :photo9, :photo10, :product1quantity, :product2quantity, :userId1, :userId2, :proposingUser, :youtube_url1, :youtube_url2, :youtube_url3, :youtube_url4, :product1id, :product2id, :status
	
	has_attached_file :photo1, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo1, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo1, :less_than => 2.megabytes
	
	has_attached_file :photo2, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo2, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo2, :less_than => 2.megabytes
	
	has_attached_file :photo3, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo3, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo3, :less_than => 2.megabytes
	
	has_attached_file :photo4, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo4, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo4, :less_than => 2.megabytes
	
	has_attached_file :photo5, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo5, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo5, :less_than => 2.megabytes
	
	has_attached_file :photo6, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo6, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo6, :less_than => 2.megabytes
	
	has_attached_file :photo7, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo7, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo7, :less_than => 2.megabytes
	
	has_attached_file :photo8, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo8, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo8, :less_than => 2.megabytes
	
	has_attached_file :photo9, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo9, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo9, :less_than => 2.megabytes
	
	has_attached_file :photo10, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :path => ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :url => "/moerse/system/:class/:id/:attachment/:style/:basename.:extension"
	validates_attachment_content_type :photo10, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo10, :less_than => 2.megabytes
	
	def product1
		return Product.find_by_id self.product1id
	end
	
	def product2
		return Product.find_by_id self.product2id
	end
	
	def owningUser1
		return User.find_by_id self.userId1
	end
	
	def owningUser2
		return User.find_by_id self.userId2
	end	
	
	def youtube_embed(youtube_url)
		if youtube_url[/youtu\.be\/([^\?]*)/]
			youtube_id = $1
		else
			# Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
			youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
			youtube_id = $5
		end
		
		return youtube_id
		#%Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
	end
end
