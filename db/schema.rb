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

ActiveRecord::Schema.define(version: 20151010045710) do

  create_table "authors", force: :cascade do |t|
    t.string   "author_name", limit: 255
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "authors", ["id"], name: "id", using: :btree
  add_index "authors", ["id"], name: "id_2", using: :btree
  add_index "authors", ["slug"], name: "index_authors_on_slug", unique: true, using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "subcategory_id",     limit: 4
    t.integer  "type_id",            limit: 4
    t.integer  "author_id",          limit: 4
    t.integer  "status_id",          limit: 4
    t.integer  "countview_id",       limit: 4
    t.text     "description",        limit: 16777215
    t.string   "created_by",         limit: 255
    t.string   "updated_by",         limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "slug",               limit: 255
  end

  add_index "books", ["id"], name: "id", using: :btree
  add_index "books", ["slug"], name: "index_books_on_slug", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "categories", ["id"], name: "id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "book_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "content",     limit: 16777215
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "slug",        limit: 255
  end

  add_index "chapters", ["book_id"], name: "book_id", using: :btree
  add_index "chapters", ["id"], name: "id", using: :btree

  create_table "countviews", force: :cascade do |t|
    t.integer  "book_id",     limit: 4
    t.integer  "count_num",   limit: 4
    t.boolean  "delete_flag"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "quote_from",  limit: 255
    t.string   "quote_at",    limit: 255
    t.text     "quote_text",  limit: 65535
  end

  add_index "quotes", ["id"], name: "id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "statuses", ["id"], name: "id", using: :btree
  add_index "statuses", ["slug"], name: "index_statuses_on_slug", unique: true, using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
    t.string   "slug",        limit: 255
  end

  add_index "subcategories", ["id"], name: "id", using: :btree
  add_index "subcategories", ["slug"], name: "index_subcategories_on_slug", unique: true, using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "created_by",  limit: 255
    t.string   "updated_by",  limit: 255
    t.boolean  "delete_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "types", ["id"], name: "id", using: :btree
  add_index "types", ["slug"], name: "index_types_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",     limit: 255
    t.string   "email",         limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "users", ["id"], name: "id", using: :btree

end
