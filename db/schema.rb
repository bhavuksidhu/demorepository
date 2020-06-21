# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_085152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.string "checksum"
    t.string "ownable_type"
    t.integer "ownable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_galleries_on_ownable_type_and_ownable_id"
  end

  create_table "galleries_performers", id: false, force: :cascade do |t|
    t.integer "gallery_id"
    t.integer "performer_id"
    t.index ["gallery_id"], name: "index_galleries_performers_on_gallery_id"
    t.index ["performer_id"], name: "index_galleries_performers_on_performer_id"
  end

  create_table "performers", force: :cascade do |t|
    t.binary "image"
    t.string "checksum"
    t.string "name"
    t.string "url"
    t.string "twitter"
    t.string "instagram"
    t.date "birthdate"
    t.string "ethnicity"
    t.string "country"
    t.string "eye_color"
    t.string "height"
    t.string "measurements"
    t.string "fake_tits"
    t.string "career_length"
    t.string "tattoos"
    t.string "piercings"
    t.string "aliases"
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checksum"], name: "index_performers_on_checksum"
    t.index ["name"], name: "index_performers_on_name"
  end

  create_table "performers_scenes", id: false, force: :cascade do |t|
    t.integer "performer_id"
    t.integer "scene_id"
    t.index ["performer_id"], name: "index_performers_scenes_on_performer_id"
    t.index ["scene_id"], name: "index_performers_scenes_on_scene_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.integer "user_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "scene_markers", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "seconds", null: false
    t.integer "scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "primary_tag_id", null: false
    t.index ["primary_tag_id"], name: "index_scene_markers_on_primary_tag_id"
    t.index ["scene_id"], name: "index_scene_markers_on_scene_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.string "url"
    t.date "date"
    t.integer "rating"
    t.string "path"
    t.string "checksum"
    t.string "size"
    t.decimal "duration", precision: 7, scale: 2
    t.string "video_codec"
    t.string "audio_codec"
    t.integer "width"
    t.integer "height"
    t.integer "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "framerate", precision: 7, scale: 2
    t.integer "bitrate"
    t.index ["checksum"], name: "index_scenes_on_checksum"
    t.index ["path"], name: "index_scenes_on_path", unique: true
    t.index ["studio_id"], name: "index_scenes_on_studio_id"
  end

  create_table "scraped_items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.date "date"
    t.string "rating"
    t.string "tags"
    t.string "models"
    t.integer "episode"
    t.string "gallery_filename"
    t.string "gallery_url"
    t.string "video_filename"
    t.string "video_url"
    t.integer "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_scraped_items_on_studio_id"
  end

  create_table "studios", force: :cascade do |t|
    t.binary "image"
    t.string "checksum"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checksum"], name: "index_studios_on_checksum"
    t.index ["name"], name: "index_studios_on_name"
  end

  create_table "taggings", force: :cascade do |t|
    t.string "taggable_type"
    t.integer "taggable_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
