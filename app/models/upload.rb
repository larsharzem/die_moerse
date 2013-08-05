class Upload < ActiveRecord::Base
	has_attached_file :photo, :styles => { :thumb => ["170x170", :jpg], :pagesize => ["600x600", :jpg], }, :default_style => :pagesize
end
