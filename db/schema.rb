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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120809060415) do

  create_table "account_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "account_type_id"
    t.text     "organization_list"
  end

  add_index "accounts", ["name"], :name => "index_accounts_on_name"

  create_table "accounts_keywords", :id => false, :force => true do |t|
    t.integer "account_id", :null => false
    t.integer "keyword_id", :null => false
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "aggregate_results", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "photos"
    t.integer  "videos"
    t.integer  "score"
    t.integer  "reviews"
    t.float    "review_avg"
    t.integer  "tweets"
    t.integer  "tweets_new"
    t.integer  "fb_likes"
    t.integer  "fb_likes_new"
    t.integer  "mentions"
    t.integer  "mentions_new"
    t.integer  "blog_posts"
    t.integer  "blog_posts_new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "listed"
    t.integer  "reviews_new"
    t.integer  "negative_reviews"
    t.integer  "negative_reviews_new"
    t.integer  "neutral_reviews"
    t.integer  "neutral_reviews_new"
    t.integer  "positive_reviews"
    t.integer  "positive_reviews_new"
    t.string   "competitor_results"
    t.integer  "fs_checkins_count"
    t.integer  "fs_users_count"
    t.integer  "fs_tip_count"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "catgroup"
    t.integer  "category_id"
    t.integer  "apphera_id"
  end

  add_index "categories", ["apphera_id"], :name => "index_categories_on_apphera_id"
  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"
  add_index "categories", ["catgroup"], :name => "index_categories_on_group"
  add_index "categories", ["country"], :name => "index_categories_on_country"

  create_table "categories_organizations", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "organization_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "command_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitors_organizations", :id => false, :force => true do |t|
    t.integer "organization_a_id", :null => false
    t.integer "organization_b_id", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "company"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "content_providers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_providers_keywords_organizations", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "keyword_id"
    t.integer  "content_provider_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_providers_proxies", :id => false, :force => true do |t|
    t.integer "content_provider_id", :null => false
    t.integer "proxy_id",            :null => false
  end

  create_table "country_codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "country_codes", ["code"], :name => "index_country_codes_on_code"
  add_index "country_codes", ["name"], :name => "index_country_codes_on_name"

  create_table "crawler_jobs", :force => true do |t|
    t.string   "token"
    t.string   "keywords"
    t.boolean  "processed"
    t.string   "city"
    t.string   "country"
    t.string   "provider"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "database_counts", :force => true do |t|
    t.integer  "tweets"
    t.integer  "twitter_users"
    t.integer  "keywords"
    t.integer  "users"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "facebook_urls", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_urls_organizations", :id => false, :force => true do |t|
    t.integer "organization_id", :null => false
    t.integer "facebook_url_id", :null => false
  end

  create_table "facebookpages", :force => true do |t|
    t.integer  "organization_id"
    t.string   "url"
    t.string   "title"
    t.integer  "likes"
    t.integer  "talking"
    t.integer  "where_here"
    t.integer  "posts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "failed_jobs", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "schedule_id"
    t.integer  "retry_count"
    t.string   "reason"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "failed_jobs", ["organization_id"], :name => "index_failed_jobs_on_organization_id"
  add_index "failed_jobs", ["schedule_id"], :name => "index_failed_jobs_on_schedule_id"

  create_table "fake_queues", :force => true do |t|
    t.text     "payload"
    t.string   "queue"
    t.integer  "in_progress"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "fake_queues", ["in_progress"], :name => "index_fake_queues_on_in_progress"
  add_index "fake_queues", ["queue"], :name => "index_fake_queues_on_queue"

  create_table "foursquare_counts", :force => true do |t|
    t.integer  "foursquare_venue_id"
    t.integer  "checkins_count"
    t.integer  "users_count"
    t.integer  "tip_count"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "foursquare_counts", ["foursquare_venue_id"], :name => "index_foursquare_counts_on_foursquare_venue_id"

  create_table "foursquare_users", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "city"
    t.string   "gender"
    t.string   "foursquare_user_id"
    t.string   "photo"
    t.string   "url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "foursquare_users", ["city"], :name => "index_foursquare_users_on_city"
  add_index "foursquare_users", ["foursquare_user_id"], :name => "index_foursquare_users_on_foursquare_user_id"

  create_table "foursquare_venues", :force => true do |t|
    t.string   "foursquare_id"
    t.string   "name"
    t.string   "phone"
    t.string   "category"
    t.integer  "organization_id"
    t.string   "top_category"
    t.string   "address"
    t.string   "city"
    t.string   "postalcode"
    t.string   "state"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "foursquare_venues", ["category"], :name => "index_foursquare_venues_on_category"
  add_index "foursquare_venues", ["foursquare_id"], :name => "index_foursquare_venues_on_foursquare_id"
  add_index "foursquare_venues", ["name"], :name => "index_foursquare_venues_on_name"
  add_index "foursquare_venues", ["organization_id"], :name => "index_foursquare_venues_on_organization_id"

  create_table "foursquare_venues_users", :id => false, :force => true do |t|
    t.integer "foursquare_venue_id", :null => false
    t.integer "foursquare_user_id",  :null => false
  end

  create_table "geodata", :force => true do |t|
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postalcode"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "metrocode"
    t.string   "areacode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "geodata", ["city"], :name => "index_geodata_on_city"
  add_index "geodata", ["country"], :name => "index_geodata_on_country"
  add_index "geodata", ["postalcode"], :name => "index_geodata_on_postalcode"
  add_index "geodata", ["region"], :name => "index_geodata_on_region"

  create_table "history_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "organization_id"
  end

  add_index "history_items", ["organization_id"], :name => "index_history_items_on_organization_id"
  add_index "history_items", ["user_id"], :name => "index_history_items_on_user_id"

  create_table "job_observers", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "retry_count"
    t.integer  "organization_id"
    t.boolean  "failed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "job_observers", ["failed"], :name => "index_job_observers_on_failed"
  add_index "job_observers", ["organization_id"], :name => "index_job_observers_on_organization_id"
  add_index "job_observers", ["schedule_id"], :name => "index_job_observers_on_schedule_id"
  add_index "job_observers", ["updated_at"], :name => "index_job_observer_updated_at"

  create_table "jobs", :force => true do |t|
    t.integer  "org_id"
    t.integer  "stage"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "keywords", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords_organizations", :id => false, :force => true do |t|
    t.integer  "keyword_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "count"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "organization_id",  :null => false
    t.string   "name"
    t.string   "content_provider"
    t.string   "phone"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "listings", ["content_provider"], :name => "index_listings_on_content_provider"
  add_index "listings", ["organization_id"], :name => "index_listings_on_org_id"

  create_table "magellans", :force => true do |t|
    t.integer  "city_id"
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_competitors", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.string   "short_profile"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "organization_id"
  end

  add_index "my_competitors", ["name"], :name => "index_new_organizations_on_name"

  create_table "network_weathers", :force => true do |t|
    t.float    "sentiment"
    t.integer  "public_keyword_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "new_twitter_users_temp", :id => false, :force => true do |t|
    t.integer  "twitter_id"
    t.string   "screen_name"
    t.string   "name"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "listed"
    t.integer  "total_statuses"
    t.string   "image_url"
    t.string   "language",       :limit => 2
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "from"
    t.date     "user_since"
  end

  create_table "organization_links", :force => true do |t|
    t.string   "bing_id"
    t.integer  "organization_id"
    t.string   "bing_display_url"
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "organization_links", ["bing_id"], :name => "index_organization_links_on_bing_id"
  add_index "organization_links", ["organization_id"], :name => "index_organization_links_on_organization_id"
  add_index "organization_links", ["url"], :name => "index_organization_links_on_url"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "street2"
    t.string   "postalcode"
    t.string   "city"
    t.string   "state"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "competitors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "account_id"
    t.boolean  "scheduled"
    t.string   "facebook"
    t.string   "twitter"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "category_id"
    t.integer  "country_code_id"
    t.text     "reviewers_list"
    t.integer  "apphera_id"
    t.boolean  "gmaps"
  end

  add_index "organizations", ["account_id"], :name => "index_organizations_account_id"
  add_index "organizations", ["apphera_id"], :name => "index_organizations_on_apphera_id"
  add_index "organizations", ["category_id"], :name => "index_organizations_on_category_id"
  add_index "organizations", ["country_code_id"], :name => "index_organizations_on_country_code_id"
  add_index "organizations", ["latitude"], :name => "index_organizations_on_latitude"
  add_index "organizations", ["longitude"], :name => "index_organizations_ot_longitude"
  add_index "organizations", ["postalcode"], :name => "index_organizations_on_postalcode"
  add_index "organizations", ["scheduled"], :name => "index_organizations_on_scheduled"

  create_table "organizations_bak", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "street2"
    t.string   "postalcode"
    t.string   "city"
    t.string   "state"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "competitors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "account_id"
    t.boolean  "scheduled"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "lat"
    t.string   "long"
    t.integer  "category_id"
  end

  add_index "organizations_bak", ["category_id"], :name => "index_organizations_on_category_id"
  add_index "organizations_bak", ["scheduled"], :name => "index_organizations_on_scheduled"

  create_table "organizations_twitter_urls", :id => false, :force => true do |t|
    t.integer "organization_id", :null => false
    t.integer "twitter_url_id",  :null => false
  end

  create_table "provider_slugs", :force => true do |t|
    t.integer  "content_provider_id"
    t.integer  "organization_id"
    t.string   "slug"
    t.boolean  "bad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provider_slugs", ["slug"], :name => "slug_UNIQUE", :unique => true

  create_table "proxies", :force => true do |t|
    t.string   "ip"
    t.string   "port"
    t.boolean  "tested"
    t.boolean  "bad"
    t.string   "country"
    t.datetime "last_used"
    t.integer  "content_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rankings", :force => true do |t|
    t.integer  "rank"
    t.integer  "content_provider_id"
    t.integer  "organization_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "name"
    t.string   "token"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "ratingcount"
    t.float    "rating"
    t.integer  "content_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "recommendations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kind"
  end

  create_table "reviewers", :force => true do |t|
    t.string   "name"
    t.integer  "content_provider_id"
    t.string   "slug"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imageurl"
    t.integer  "review_count"
    t.float    "average_review"
  end

  add_index "reviewers", ["content_provider_id"], :name => "index_reviewers_on_content_provider_id"
  add_index "reviewers", ["name"], :name => "index_reviewers_on_name"
  add_index "reviewers", ["slug"], :name => "index_reviewers_on_slug"

  create_table "reviewers_reviews", :id => false, :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "review_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "content_provider_id"
    t.string   "reviewer"
    t.string   "reviewer_slug"
    t.date     "review_date"
    t.text     "body"
    t.float    "rating"
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reviewer_id"
    t.string   "review_provider_id"
    t.string   "title"
    t.string   "review_url"
  end

  add_index "reviews", ["review_url"], :name => "index_reviews_on_review_url"
  add_index "reviews", ["reviewer_id"], :name => "index_reviews_on_reviewer_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schedules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "sequence_id"
    t.boolean  "in_progress"
    t.datetime "scheduled"
  end

  add_index "schedules", ["in_progress"], :name => "index_schedules_on_in_progress"
  add_index "schedules", ["organization_id"], :name => "index_schedules_on_organization_id"
  add_index "schedules", ["scheduled"], :name => "index_schedules_on_scheduled"
  add_index "schedules", ["sequence_id"], :name => "index_schedules_on_sequence_id"

  create_table "sentiments", :force => true do |t|
    t.string   "word"
    t.string   "language",   :limit => 2
    t.float    "value"
    t.string   "position"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.boolean  "tested"
    t.boolean  "correct"
  end

  add_index "sentiments", ["correct"], :name => "index_sentiments_on_correct"
  add_index "sentiments", ["tested"], :name => "index_sentiments_on_tested"

  create_table "sequence_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sequence_items_sequences", :id => false, :force => true do |t|
    t.integer "sequence_item_id"
    t.integer "sequence_id"
  end

  create_table "sequences", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "slug_urls", :force => true do |t|
    t.string   "slug"
    t.integer  "content_provider_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "slug_urls", ["content_provider_id"], :name => "index_slug_urls_on_content_provider_id"
  add_index "slug_urls", ["slug"], :name => "index_slug_urls_on_slug"

  create_table "task_results", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "task_id"
    t.boolean  "relevant"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "task_results", ["organization_id"], :name => "index_task_results_on_organization_id"
  add_index "task_results", ["relevant"], :name => "index_task_results_on_relevant"
  add_index "task_results", ["status"], :name => "index_task_results_on_status"
  add_index "task_results", ["task_id"], :name => "index_task_results_on_task_id"

  create_table "task_translations", :force => true do |t|
    t.integer  "task_id"
    t.integer  "language_id"
    t.string   "header"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "task_translations", ["language_id"], :name => "index_task_translations_on_language_id"
  add_index "task_translations", ["task_id"], :name => "index_task_translations_on_task_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "weight"
  end

  add_index "tasks", ["name"], :name => "index_tasks_on_name"

  create_table "timer_options", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet_id"
    t.string   "content"
    t.string   "in_reply_to"
    t.integer  "re_tweets"
    t.datetime "created_at",      :null => false
    t.float    "sentiment"
    t.datetime "updated_at",      :null => false
    t.integer  "twitter_user_id"
    t.integer  "favorites_count"
  end

  add_index "tweets", ["content"], :name => "index_tweets_on_content"
  add_index "tweets", ["created_at"], :name => "index_tweets_on_created_at"
  add_index "tweets", ["in_reply_to"], :name => "index_tweets_on_in_reply_to"
  add_index "tweets", ["sentiment"], :name => "index_tweets_on_sentiment"
  add_index "tweets", ["tweet_id"], :name => "index_tweets_on_tweet_id"
  add_index "tweets", ["twitter_user_id"], :name => "index_tweets_on_twitter_user_id"

  create_table "twitter_counts", :force => true do |t|
    t.integer  "twitter_url_id"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "tweets"
    t.integer  "listed"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "twitter_counts", ["twitter_url_id"], :name => "index_twitter_counts_on_twitter_url_id"

  create_table "twitter_urls", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", :force => true do |t|
    t.string   "screen_name",    :limit => 145
    t.string   "name",           :limit => 145
    t.integer  "followers"
    t.integer  "following"
    t.integer  "listed"
    t.integer  "total_statuses"
    t.string   "image_url"
    t.string   "language",       :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from"
    t.date     "user_since"
  end

  create_table "uptime_monitors", :force => true do |t|
    t.integer  "organization_id"
    t.float    "load_time"
    t.datetime "time_stamp"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "url"
  end

  add_index "uptime_monitors", ["organization_id"], :name => "index_uptime_monitors_on_organization_id"
  add_index "uptime_monitors", ["time_stamp"], :name => "index_uptime_monitors_on_time_stamp"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "account_id"
    t.string   "api_key"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"
  add_index "users", ["api_key"], :name => "index_users_on_api_key"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "work_queues", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "retry_count"
    t.string   "queue_name"
    t.string   "url"
    t.integer  "org_id"
    t.string   "content_provider"
    t.string   "keywords"
    t.string   "misc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "invisible"
  end

  add_index "work_queues", ["content_provider"], :name => "index_work_queues_on_content_provider"
  add_index "work_queues", ["invisible"], :name => "index_work_queues_on_invisible"
  add_index "work_queues", ["org_id"], :name => "index_work_queues_on_org_id"
  add_index "work_queues", ["queue_name"], :name => "index_work_queues_on_queue_name"
  add_index "work_queues", ["retry_count"], :name => "index_work_queues_on_retry_count"
  add_index "work_queues", ["schedule_id"], :name => "index_work_queues_on_schedule_id"

end
