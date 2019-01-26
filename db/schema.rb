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

ActiveRecord::Schema.define(version: 2019_02_19_061049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "crew_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_attachments_on_creator_id"
    t.index ["crew_id"], name: "index_attachments_on_crew_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "creator_id"
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["creator_id"], name: "index_comments_on_creator_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "crew_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_conversations_on_creator_id"
    t.index ["crew_id"], name: "index_conversations_on_crew_id"
  end

  create_table "crew_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crew_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_crew_members_on_crew_id"
    t.index ["user_id", "crew_id"], name: "index_crew_members_on_user_id_and_crew_id", unique: true
    t.index ["user_id"], name: "index_crew_members_on_user_id"
  end

  create_table "crews", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_crews_on_owner_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "crew_id", null: false
    t.integer "feedable_id", null: false
    t.string "feedable_type", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_feeds_on_crew_id"
    t.index ["feedable_type", "feedable_id"], name: "index_feeds_on_feedable_type_and_feedable_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "crew_id", null: false
    t.string "title"
    t.text "text"
    t.boolean "shared", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_notes_on_creator_id"
    t.index ["crew_id"], name: "index_notes_on_crew_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.bigint "poll_id", null: false
    t.string "value", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id", "position"], name: "index_poll_options_on_poll_id_and_position", unique: true
    t.index ["poll_id", "value"], name: "index_poll_options_on_poll_id_and_value", unique: true
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "crew_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_polls_on_creator_id"
    t.index ["crew_id"], name: "index_polls_on_crew_id"
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "crew_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "completed_at"
    t.bigint "completer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completer_id"], name: "index_todos_on_completer_id"
    t.index ["creator_id"], name: "index_todos_on_creator_id"
    t.index ["crew_id"], name: "index_todos_on_crew_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachments", "crews"
  add_foreign_key "attachments", "users", column: "creator_id"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "conversations", "users", column: "creator_id"
  add_foreign_key "crews", "users", column: "owner_id"
  add_foreign_key "feeds", "crews"
  add_foreign_key "notes", "crews"
  add_foreign_key "notes", "users", column: "creator_id"
  add_foreign_key "poll_options", "polls"
  add_foreign_key "polls", "crews"
  add_foreign_key "polls", "users", column: "creator_id"
  add_foreign_key "todos", "crews"
  add_foreign_key "todos", "users", column: "completer_id"
  add_foreign_key "todos", "users", column: "creator_id"
end
