# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_05_173838) do

  create_table "currencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "symbol", limit: 10, null: false
    t.decimal "USDExchange", precision: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol"], name: "index_currencies_on_symbol"
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "division", limit: 50
    t.string "manager", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "jira_issues", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "jira_issue_id"
    t.bigint "jira_project_id", null: false
    t.text "issue_key", null: false
    t.text "issue_url", null: false
    t.text "issue_title", null: false
    t.text "issue_status", null: false
    t.text "issue_type", null: false
    t.integer "story_points", default: 1
    t.datetime "issue_created"
    t.datetime "issue_updated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jira_issue_id"], name: "index_jira_issues_on_jira_issue_id"
    t.index ["jira_project_id"], name: "index_jira_issues_on_jira_project_id"
  end

  create_table "jira_projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "jira_project_id", null: false
    t.string "name", null: false
    t.text "jira_key", null: false
    t.integer "total_issue_count", default: 0
    t.datetime "last_issue_update"
    t.text "self_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jira_project_id"], name: "index_jira_projects_on_jira_project_id"
    t.index ["name"], name: "index_jira_projects_on_name"
    t.index ["project_id"], name: "index_jira_projects_on_project_id"
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 30, null: false
    t.bigint "role_id", null: false
    t.bigint "department_id", null: false
    t.bigint "source_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_members_on_department_id"
    t.index ["role_id"], name: "index_members_on_role_id"
    t.index ["source_id"], name: "index_members_on_source_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "stream_id", null: false
    t.string "name"
    t.boolean "internal"
    t.date "start_date"
    t.date "end_date"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stream_id"], name: "index_projects_on_stream_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.boolean "shared", default: false
    t.boolean "administration", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "contact", limit: 50, null: false
    t.string "contact_title", limit: 50
    t.string "contact_phone", limit: 50
    t.string "contact_email", limit: 80, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_sources_on_name"
  end

  create_table "streams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "stakeholder", limit: 50
    t.string "stakeholder_email", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_streams_on_name"
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "project_id", null: false
    t.integer "annual_rate", null: false
    t.integer "weekly_rate", null: false
    t.bigint "currency_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "allocation", default: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_teams_on_currency_id"
    t.index ["member_id"], name: "index_teams_on_member_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "jira_issues", "jira_projects"
  add_foreign_key "members", "departments"
  add_foreign_key "members", "roles"
  add_foreign_key "members", "sources"
  add_foreign_key "projects", "streams"
  add_foreign_key "teams", "currencies"
  add_foreign_key "teams", "members"
  add_foreign_key "teams", "projects"
end
