# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120418114404) do

  create_table "bargains", :force => true do |t|
    t.integer  "product1quantity"
    t.integer  "product2quantity"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "userId1"
    t.integer  "userId2"
    t.integer  "product1id"
    t.integer  "product2id"
    t.integer  "proposingUser"
    t.string   "youtube_url1"
    t.string   "youtube_url2"
    t.string   "photo1_file_name"
    t.integer  "photo1_file_size"
    t.string   "photo1_content_type"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.integer  "photo2_file_size"
    t.string   "photo2_content_type"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.integer  "photo3_file_size"
    t.string   "photo3_content_type"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.integer  "photo4_file_size"
    t.string   "photo4_content_type"
    t.datetime "photo4_updated_at"
    t.string   "photo5_file_name"
    t.integer  "photo5_file_size"
    t.string   "photo5_content_type"
    t.datetime "photo5_updated_at"
    t.string   "photo6_file_name"
    t.integer  "photo6_file_size"
    t.string   "photo6_content_type"
    t.datetime "photo6_updated_at"
    t.string   "photo7_file_name"
    t.integer  "photo7_file_size"
    t.string   "photo7_content_type"
    t.datetime "photo7_updated_at"
    t.string   "photo8_file_name"
    t.integer  "photo8_file_size"
    t.string   "photo8_content_type"
    t.datetime "photo8_updated_at"
    t.string   "photo9_file_name"
    t.integer  "photo9_file_size"
    t.string   "photo9_content_type"
    t.datetime "photo9_updated_at"
    t.string   "photo10_file_name"
    t.integer  "photo10_file_size"
    t.string   "photo10_content_type"
    t.datetime "photo10_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "userId"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views"
    t.string   "photo1_file_name"
    t.integer  "photo1_file_size"
    t.string   "photo1_content_type"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.integer  "photo2_file_size"
    t.string   "photo2_content_type"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.integer  "photo3_file_size"
    t.string   "photo3_content_type"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.integer  "photo4_file_size"
    t.string   "photo4_content_type"
    t.datetime "photo4_updated_at"
    t.boolean  "inactive"
    t.integer  "weight"
    t.string   "brand"
    t.string   "comment"
    t.string   "productClass"
    t.string   "subject"
  end

  create_table "uploads", :force => true do |t|
    t.string   "description"
    t.integer  "product_id"
    t.string   "photo_file_name"
    t.string   "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views"
    t.string   "password"
    t.string   "salt"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_file_name"
    t.boolean  "inactive"
    t.boolean  "gotSample"
  end

end
