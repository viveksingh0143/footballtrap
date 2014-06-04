# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140509153614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: true do |t|
    t.string   "program"
    t.string   "version"
    t.string   "package"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["device_id"], name: "index_apps_on_device_id", using: :btree

  create_table "audios", force: true do |t|
    t.string   "uniqid"
    t.string   "title"
    t.datetime "capture"
    t.string   "url"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audios", ["device_id"], name: "index_audios_on_device_id", using: :btree

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "uniqid"
    t.string   "number"
    t.string   "name"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["device_id"], name: "index_contacts_on_device_id", using: :btree

  create_table "devices", force: true do |t|
    t.string   "name",                     null: false
    t.string   "imei",                     null: false
    t.string   "serial_number"
    t.string   "devise_type",              null: false
    t.string   "os"
    t.string   "hardware_platform"
    t.string   "platform_string"
    t.string   "total_memory"
    t.string   "total_disk"
    t.string   "free_disk_space"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deviceid"
    t.string   "device_software_version"
    t.string   "version_incremental"
    t.string   "os_version"
    t.string   "available_processors"
    t.string   "build_id"
    t.string   "build_board"
    t.string   "build_bootloader"
    t.string   "build_brand"
    t.string   "build_display"
    t.string   "build_fingerprint"
    t.string   "build_hardware"
    t.string   "build_host"
    t.string   "build_manufacturer"
    t.string   "build_model"
    t.string   "build_product"
    t.string   "build_serial"
    t.string   "build_tags"
    t.string   "build_time"
    t.string   "build_type"
    t.string   "build_unknown"
    t.string   "builduser"
    t.string   "build_cpu_abi"
    t.string   "build_cpu_abi2"
    t.string   "build_version_release"
    t.string   "build_version_sdk"
    t.string   "free_memory_latitude"
    t.string   "line1_number_longitude"
    t.string   "max_memory"
    t.string   "network_kountry_iso"
    t.string   "network_operator_name"
    t.string   "os_build_brand"
    t.string   "os_build_device"
    t.string   "os_build_manufacturer"
    t.string   "os_build_model"
    t.string   "os_build_version_release"
    t.string   "sim_kountry_iso"
    t.string   "sim_serial_number"
    t.string   "voice_mail_number"
  end

  add_index "devices", ["imei"], name: "index_devices_on_imei", unique: true, using: :btree
  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "forms", force: true do |t|
    t.string   "name",       null: false
    t.string   "subject",    null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.text     "message",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "uniqid"
    t.string   "title"
    t.datetime "capture"
    t.string   "url"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["device_id"], name: "index_images_on_device_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "time"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "locations", ["device_id"], name: "index_locations_on_device_id", using: :btree

  create_table "logs", force: true do |t|
    t.string   "uniqid"
    t.integer  "contact_id"
    t.string   "log_type"
    t.datetime "time"
    t.decimal  "duration"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["device_id"], name: "index_logs_on_device_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "uniqid"
    t.integer  "contact_id"
    t.string   "msg_type"
    t.text     "message"
    t.datetime "time"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["device_id"], name: "index_messages_on_device_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title",      null: false
    t.string   "slug",       null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                           null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "salt",                               null: false
    t.integer  "status",             default: 0,     null: false
    t.boolean  "admin",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username", "status"], name: "index_users_on_username_and_status", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "uniqid"
    t.string   "title"
    t.datetime "capture"
    t.string   "url"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["device_id"], name: "index_videos_on_device_id", using: :btree

end
