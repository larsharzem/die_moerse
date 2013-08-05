class User < ActiveRecord::Base

    attr_accessible :email, :password, :password_confirmation, :name, :photo, :salt, :views, :inactive, :gotSample, :views
	
	# validates_confirmation_of :password
	validates_presence_of :password
	validates_presence_of :email
	validates_uniqueness_of :email
	
	# attr_protected :id, :salt
	
	validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
	
    validates_confirmation_of :password, :confirmation => true, :presence => true
	
	# has_attached_file :photo, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/:class/:attachment/:id/:style_:basename.:extension"
	#has_attached_file :photo, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/system/:attachment/:id/:style/:basename.:extension"
	has_attached_file :photo, :styles => { :thumb  => "130x130", :medium => "500x500", :large =>  "750x750"}, :url => "/moerse/system/:class/:attachment/:id/:style/:basename.:extension", :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename"
	validates_attachment_content_type :photo, :content_type => [ 'image/png', 'image/x-png', 'image/jpg', 'image/jpeg', 'image/gif' ], :message => 'Die angegebene Datei ist keine Bilddatei.'
	validates_attachment_size :photo, :less_than => 2.megabytes

	# attr_accessor :password
    before_save :encrypt_password

    def self.authenticate email, password
        user = find_by_email email
		# puts user.inspect
		# puts "USER AUTH"
		# puts password
		# puts "vs."
		# puts user.password
		# puts (BCrypt::Engine.hash_secret password, user.salt)
        if user && user.password == (BCrypt::Engine.hash_secret password, user.salt)
            return user
        else
            return false
        end
    end

    def encrypt_password
		# puts "SAVING USER: #{self.inspect}"
		# puts password.present?
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret password, self.salt
			puts self.salt
			puts self.password
        end
    end
	
	def random_password(size = 10)
		chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
		return (1..size).collect{|a| chars[rand(chars.size)] }.join
	end
end
