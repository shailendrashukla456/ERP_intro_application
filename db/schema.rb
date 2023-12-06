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

ActiveRecord::Schema.define(version: 2023_12_06_102422) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_admin_managed_resources", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_firm_name"
    t.string "contact_person"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.integer "blacklisted"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "designations", force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "designation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_designations_on_department_id"
  end

  create_table "product_l1_categories", force: :cascade do |t|
    t.string "l1_category_name"
    t.string "l1_category_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_l2_categories", force: :cascade do |t|
    t.integer "product_l1_category_id", null: false
    t.string "l2_category_name"
    t.string "l2_category_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_l1_category_id"], name: "index_product_l2_categories_on_product_l1_category_id"
  end

  create_table "product_l3_categories", force: :cascade do |t|
    t.integer "product_l2_category_id", null: false
    t.integer "product_l1_category_id", null: false
    t.string "l3_category_name"
    t.string "l3_category_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_l1_category_id"], name: "index_product_l3_categories_on_product_l1_category_id"
    t.index ["product_l2_category_id"], name: "index_product_l3_categories_on_product_l2_category_id"
  end

  create_table "product_names", force: :cascade do |t|
    t.integer "product_l1_category_id", null: false
    t.integer "product_l2_category_id", null: false
    t.integer "product_l3_category_id", null: false
    t.string "product_name"
    t.integer "unit_of_measurement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_l1_category_id"], name: "index_product_names_on_product_l1_category_id"
    t.index ["product_l2_category_id"], name: "index_product_names_on_product_l2_category_id"
    t.index ["product_l3_category_id"], name: "index_product_names_on_product_l3_category_id"
    t.index ["unit_of_measurement_id"], name: "index_product_names_on_unit_of_measurement_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.string "shift_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "tax_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unit_of_measurements", force: :cascade do |t|
    t.string "uom_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name"
    t.integer "department_id", null: false
    t.integer "designation_id", null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "email"
    t.string "phone1"
    t.string "phone2"
    t.string "blood_group"
    t.string "aadhar_card"
    t.string "driving_license_number"
    t.string "father_name"
    t.string "mother_name"
    t.string "emergency_contact_person"
    t.string "emergency_contact_person_mobile"
    t.string "upload_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_user_profiles_on_department_id"
    t.index ["designation_id"], name: "index_user_profiles_on_designation_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "vendor_firm_name"
    t.string "contact_person"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.integer "blacklisted"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "designations", "departments"
  add_foreign_key "product_l2_categories", "product_l1_categories"
  add_foreign_key "product_l3_categories", "product_l1_categories"
  add_foreign_key "product_l3_categories", "product_l2_categories"
  add_foreign_key "product_names", "product_l1_categories"
  add_foreign_key "product_names", "product_l2_categories"
  add_foreign_key "product_names", "product_l3_categories"
  add_foreign_key "product_names", "unit_of_measurements"
  add_foreign_key "user_profiles", "departments"
  add_foreign_key "user_profiles", "designations"
end
