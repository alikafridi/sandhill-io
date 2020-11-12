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

ActiveRecord::Schema.define(version: 20201112010029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "logo_url"
    t.string "domain"
    t.string "type"
    t.string "clients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "linkedin_url"
    t.integer "employee_count"
    t.string "description"
    t.integer "year_founded"
    t.string "location"
  end

  create_table "agencies_categories", id: false, force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "category_id", null: false
    t.index ["agency_id", "category_id"], name: "index_agencies_categories_on_agency_id_and_category_id"
    t.index ["category_id", "agency_id"], name: "index_agencies_categories_on_category_id_and_agency_id"
  end

  create_table "app_data", force: :cascade do |t|
    t.string "app_type"
    t.integer "monthly_revenue"
    t.integer "monthly_downloads"
    t.datetime "date_collected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mobile_app_id"
    t.index ["mobile_app_id"], name: "index_app_data_on_mobile_app_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.text "author"
    t.text "date"
    t.text "image"
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "highlight"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "ordering"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_mobile_apps", id: false, force: :cascade do |t|
    t.bigint "mobile_app_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "mobile_app_id"], name: "index_categories_mobile_apps_on_category_id_and_mobile_app_id"
    t.index ["mobile_app_id", "category_id"], name: "index_categories_mobile_apps_on_mobile_app_id_and_category_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "founders"
    t.integer "year_founded"
    t.string "linkedin_url"
    t.string "headquarters"
    t.integer "combined_alexa"
    t.integer "employee_count"
    t.integer "capital_raised"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "stage"
    t.string "ancestry"
    t.integer "category_id"
    t.string "main_domain"
    t.index ["ancestry"], name: "index_companies_on_ancestry"
  end

  create_table "daycares", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "url"
    t.string "call_phone"
    t.string "text_phone"
    t.string "email"
    t.string "center_description"
    t.string "additional_info"
    t.string "yelp_url"
    t.string "hours_open"
    t.string "days_open"
    t.string "ages"
    t.string "center_type"
    t.string "center_tuition"
    t.string "care_type"
    t.string "accreditation_type"
    t.string "religious_affiliations"
    t.string "languages_spoken"
    t.boolean "spots_available"
    t.string "availability_information"
    t.decimal "rating_score"
    t.integer "rating_count"
    t.string "student_teacher_ratio"
    t.string "added_tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_owner"
    t.string "contact_name"
    t.string "contact_position"
    t.string "contact_personal_num"
    t.string "daycare_license_number"
    t.string "center_district"
    t.string "center_fax"
    t.float "latitude"
    t.float "longitude"
    t.string "slug"
    t.index ["slug"], name: "index_daycares_on_slug", unique: true
  end

  create_table "domain_alexas", force: :cascade do |t|
    t.integer "alexa_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "domain_id"
    t.string "domain_url"
    t.datetime "date"
    t.integer "reach_rank_value"
    t.decimal "reach_per_million_value"
    t.integer "page_views_rank_value"
    t.decimal "page_views_per_million_value"
    t.decimal "page_views_per_user_value"
  end

  create_table "domain_categories", force: :cascade do |t|
    t.string "domain"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "domain_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_domain_categories_on_category_id"
    t.index ["domain_id"], name: "index_domain_categories_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "domain"
    t.string "name"
    t.string "description"
    t.string "logo"
    t.integer "year_founded"
    t.string "headquarters"
    t.string "cover_photo"
    t.string "countries"
    t.string "status"
    t.string "sub_category"
    t.string "tags"
    t.string "ancestry"
    t.string "comm_platform"
    t.integer "alexa_rank"
    t.string "funds_raised"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.string "slug"
    t.integer "company_id"
    t.float "page_views_per_million"
    t.float "reach_views_per_million"
    t.string "platform"
    t.datetime "alexa_enriched"
    t.datetime "domain_enriched"
    t.integer "alexa_90day_delta"
    t.integer "employee_count"
    t.integer "employee_growth"
    t.index ["ancestry"], name: "index_domains_on_ancestry"
    t.index ["slug"], name: "index_domains_on_slug", unique: true
  end

  create_table "domains_locations", id: false, force: :cascade do |t|
    t.bigint "domain_id", null: false
    t.bigint "location_id", null: false
    t.index ["domain_id", "location_id"], name: "index_domains_locations_on_domain_id_and_location_id"
    t.index ["location_id", "domain_id"], name: "index_domains_locations_on_location_id_and_domain_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.boolean "auto_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "follow_url"
    t.string "tags"
    t.string "description"
    t.string "default_author"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "linkedin_counts", force: :cascade do |t|
    t.integer "company_id"
    t.integer "employee_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.string "uid"
    t.string "domain"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.string "slug"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_locations_on_ancestry"
    t.index ["slug"], name: "index_locations_on_slug", unique: true
  end

  create_table "mobile_apps", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "ios_link"
    t.string "android_link"
    t.string "ios_sensortower_link"
    t.string "android_sensortower_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["slug"], name: "index_mobile_apps_on_slug", unique: true
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "article_link"
    t.string "description"
    t.integer "upvotes"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "publisher"
    t.string "author"
    t.datetime "date_published"
    t.boolean "publish"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
