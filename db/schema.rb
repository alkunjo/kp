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

ActiveRecord::Schema.define(version: 20160723183505) do

  create_table "dosages", primary_key: "dosage_id", force: :cascade do |t|
    t.string   "dosage_name",  limit: 255
    t.string   "dosage_judul", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dtrans", id: false, force: :cascade do |t|
    t.integer  "dta_qty",      limit: 4
    t.integer  "dtd_qty",      limit: 4
    t.string   "dt_rsn",       limit: 255
    t.integer  "obat_id",      limit: 4,   default: 0, null: false
    t.integer  "transaksi_id", limit: 4,   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "dtt_qty",      limit: 4
  end

  add_index "dtrans", ["obat_id"], name: "index_dtrans_on_obat_id", using: :btree
  add_index "dtrans", ["transaksi_id"], name: "index_dtrans_on_transaksi_id", using: :btree

  create_table "generiks", primary_key: "generik_id", force: :cascade do |t|
    t.string   "generik_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "grup_obats", primary_key: "gobat_id", force: :cascade do |t|
    t.string   "gobat_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kategori_obats", primary_key: "kobat_id", force: :cascade do |t|
    t.string   "kobat_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kemasans", primary_key: "kemasan_id", force: :cascade do |t|
    t.string   "kemasan_name", limit: 255
    t.integer  "kemasan_vol",  limit: 4
    t.integer  "kemasan_cap",  limit: 4
    t.string   "kemasan_unit", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "kreditur_pabriks", id: false, force: :cascade do |t|
    t.integer  "kreditur_id", limit: 4, default: 0, null: false
    t.integer  "pabrik_id",   limit: 4, default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "kreditur_pabriks", ["kreditur_id"], name: "index_kreditur_pabriks_on_kreditur_id", using: :btree
  add_index "kreditur_pabriks", ["pabrik_id"], name: "index_kreditur_pabriks_on_pabrik_id", using: :btree

  create_table "krediturs", primary_key: "kreditur_id", force: :cascade do |t|
    t.string   "kreditur_name",    limit: 255
    t.string   "kreditur_address", limit: 255
    t.string   "kreditur_phone",   limit: 255
    t.string   "kreditur_fax",     limit: 255
    t.string   "kreditur_email",   limit: 255
    t.string   "kreditur_cp",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "obats", primary_key: "obat_id", force: :cascade do |t|
    t.integer  "grup_obat_id",     limit: 4
    t.integer  "generik_id",       limit: 4
    t.integer  "dosage_id",        limit: 4
    t.integer  "racik_id",         limit: 4
    t.integer  "kategori_obat_id", limit: 4
    t.integer  "kemasan_id",       limit: 4
    t.integer  "pabrik_id",        limit: 4
    t.string   "obat_name",        limit: 255
    t.integer  "obat_minStock",    limit: 4
    t.integer  "obat_hpp",         limit: 4
    t.integer  "obat_hna",         limit: 4
    t.integer  "obat_kons",        limit: 4
    t.integer  "obat_askes",       limit: 4
    t.integer  "obat_hnask",       limit: 4
    t.integer  "obat_hnahppn",     limit: 4
    t.integer  "obat_hnaskppn",    limit: 4
    t.integer  "obat_hja",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "obats", ["dosage_id"], name: "index_obats_on_dosage_id", using: :btree
  add_index "obats", ["generik_id"], name: "index_obats_on_generik_id", using: :btree
  add_index "obats", ["grup_obat_id"], name: "index_obats_on_grup_obat_id", using: :btree
  add_index "obats", ["kategori_obat_id"], name: "index_obats_on_kategori_obat_id", using: :btree
  add_index "obats", ["kemasan_id"], name: "index_obats_on_kemasan_id", using: :btree
  add_index "obats", ["pabrik_id"], name: "index_obats_on_pabrik_id", using: :btree
  add_index "obats", ["racik_id"], name: "index_obats_on_racik_id", using: :btree

  create_table "outlet_types", primary_key: "otype_id", force: :cascade do |t|
    t.string   "otype_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "outlets", primary_key: "outlet_id", force: :cascade do |t|
    t.integer  "outlet_type_id", limit: 4
    t.string   "outlet_name",    limit: 255
    t.string   "outlet_address", limit: 255
    t.string   "outlet_phone",   limit: 255
    t.string   "outlet_city",    limit: 255
    t.string   "outlet_email",   limit: 255
    t.string   "outlet_fax",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "outlets", ["outlet_type_id"], name: "index_outlets_on_outlet_type_id", using: :btree

  create_table "pabriks", primary_key: "pabrik_id", force: :cascade do |t|
    t.string   "pabrik_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "positions", primary_key: "position_id", force: :cascade do |t|
    t.string   "position_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "raciks", primary_key: "racik_id", force: :cascade do |t|
    t.string   "racik_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", primary_key: "role_id", force: :cascade do |t|
    t.string   "role_name",  limit: 255
    t.text     "role_desc",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "stocks", primary_key: "stock_id", force: :cascade do |t|
    t.integer  "stok_qty",   limit: 4
    t.integer  "outlet_id",  limit: 4
    t.integer  "obat_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "stocks", ["obat_id"], name: "index_stocks_on_obat_id", using: :btree
  add_index "stocks", ["outlet_id"], name: "index_stocks_on_outlet_id", using: :btree

  create_table "transaksis", primary_key: "transaksi_id", force: :cascade do |t|
    t.integer  "trans_status", limit: 4
    t.integer  "sender_id",    limit: 4
    t.integer  "receiver_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "asked_at"
    t.datetime "dropped_at"
    t.datetime "accepted_at"
  end

  add_index "transaksis", ["receiver_id"], name: "index_transaksis_on_receiver_id", using: :btree
  add_index "transaksis", ["sender_id"], name: "index_transaksis_on_sender_id", using: :btree

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.integer  "role_id",                limit: 4
    t.integer  "position_id",            limit: 4
    t.string   "user_username",          limit: 255
    t.string   "user_name",              limit: 255
    t.string   "user_address",           limit: 255
    t.string   "user_phone",             limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "outlet_id",              limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["outlet_id"], name: "index_users_on_outlet_id", using: :btree
  add_index "users", ["position_id"], name: "index_users_on_position_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "dtrans", "obats", primary_key: "obat_id"
  add_foreign_key "dtrans", "transaksis", primary_key: "transaksi_id"
  add_foreign_key "kreditur_pabriks", "krediturs", primary_key: "kreditur_id"
  add_foreign_key "kreditur_pabriks", "pabriks", primary_key: "pabrik_id"
  add_foreign_key "obats", "dosages", primary_key: "dosage_id"
  add_foreign_key "obats", "generiks", primary_key: "generik_id"
  add_foreign_key "obats", "grup_obats", primary_key: "gobat_id"
  add_foreign_key "obats", "kategori_obats", primary_key: "kobat_id"
  add_foreign_key "obats", "kemasans", primary_key: "kemasan_id"
  add_foreign_key "obats", "pabriks", primary_key: "pabrik_id"
  add_foreign_key "obats", "raciks", primary_key: "racik_id"
  add_foreign_key "outlets", "outlet_types", primary_key: "otype_id"
  add_foreign_key "stocks", "obats", primary_key: "obat_id"
  add_foreign_key "stocks", "outlets", primary_key: "outlet_id"
  add_foreign_key "users", "outlets", primary_key: "outlet_id"
  add_foreign_key "users", "positions", primary_key: "position_id"
  add_foreign_key "users", "roles", primary_key: "role_id"
end
