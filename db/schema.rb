ActiveRecord::Schema[7.0].define(version: 2023_02_21_181456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_payments", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_payments_on_category_id"
    t.index ["payment_id"], name: "index_category_payments_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_payments", "categories"
  add_foreign_key "category_payments", "payments"
  add_foreign_key "payments", "users"
end
