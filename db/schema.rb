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

ActiveRecord::Schema.define(version: 20170423131326) do

  create_table "advisors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "student_id",   null: false
    t.integer  "personnel_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["personnel_id"], name: "index_advisors_on_personnel_id", using: :btree
    t.index ["student_id"], name: "index_advisors_on_student_id", using: :btree
  end

  create_table "belong_tos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "student_id", null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_belong_tos_on_group_id", using: :btree
    t.index ["student_id"], name: "index_belong_tos_on_student_id", using: :btree
  end

  create_table "codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.integer  "department_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_codes_on_department_id", using: :btree
  end

  create_table "competes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id",   null: false
    t.integer  "event_id",   null: false
    t.string   "award"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_competes_on_event_id", using: :btree
    t.index ["group_id"], name: "index_competes_on_group_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "code_id",    null: false
    t.integer  "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_courses_on_code_id", using: :btree
  end

  create_table "curriculums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.string   "description"
    t.integer  "department_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_curriculums_on_department_id", using: :btree
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "grade",      limit: 24
    t.integer  "section_id",            null: false
    t.string   "student_id",            null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["section_id"], name: "index_enrollments_on_section_id", using: :btree
    t.index ["student_id"], name: "index_enrollments_on_student_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date"
    t.string   "explanation"
    t.string   "name"
    t.boolean  "isActivity"
    t.boolean  "isCompetition"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "gpas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "year",                  null: false
    t.integer  "semester",              null: false
    t.integer  "credit",                null: false
    t.float    "gpa",        limit: 24
    t.string   "student_id",            null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["student_id"], name: "index_gpas_on_student_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_leaves_on_group_id", using: :btree
  end

  create_table "log_breaks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "remark"
    t.datetime "when",       null: false
    t.integer  "rule_id",    null: false
    t.string   "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_log_breaks_on_rule_id", using: :btree
    t.index ["student_id"], name: "index_log_breaks_on_student_id", using: :btree
  end

  create_table "participates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id",   null: false
    t.integer  "event_id",   null: false
    t.string   "position"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participates_on_event_id", using: :btree
    t.index ["group_id"], name: "index_participates_on_group_id", using: :btree
  end

  create_table "personal_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "project_name", null: false
    t.integer  "leave_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["leave_id"], name: "index_personal_leaves_on_leave_id", using: :btree
  end

  create_table "personnels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "ssn"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "role",                 null: false
    t.string   "email",                null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "manage_department_id"
    t.integer  "workin_department_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["email"], name: "index_personnels_on_email", unique: true, using: :btree
    t.index ["manage_department_id"], name: "index_personnels_on_manage_department_id", using: :btree
    t.index ["workin_department_id"], name: "index_personnels_on_workin_department_id", using: :btree
  end

  create_table "requires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "curriculum_id", null: false
    t.integer  "course_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["course_id"], name: "index_requires_on_course_id", using: :btree
    t.index ["curriculum_id"], name: "index_requires_on_curriculum_id", using: :btree
  end

  create_table "rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rule_detail",              null: false
    t.integer  "behavior_score_reduction", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "section_id",   null: false
    t.integer  "time_slot_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["section_id"], name: "index_schedules_on_section_id", using: :btree
    t.index ["time_slot_id"], name: "index_schedules_on_time_slot_id", using: :btree
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sec",        null: false
    t.integer  "year",       null: false
    t.integer  "semester",   null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sections_on_course_id", using: :btree
  end

  create_table "sick_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "reason",     null: false
    t.integer  "leave_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_id"], name: "index_sick_leaves_on_leave_id", using: :btree
  end

  create_table "students", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "ssn"
    t.date     "birth_date"
    t.string   "gender"
    t.integer  "enroll_year"
    t.string   "status"
    t.string   "email",         null: false
    t.integer  "curriculum_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["curriculum_id"], name: "index_students_on_curriculum_id", using: :btree
  end

  create_table "teaches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "personnel_id", null: false
    t.integer  "section_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["personnel_id"], name: "index_teaches_on_personnel_id", using: :btree
    t.index ["section_id"], name: "index_teaches_on_section_id", using: :btree
  end

  create_table "time_slots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "day",        null: false
    t.time     "start",      null: false
    t.time     "end",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "advisors", "personnels", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advisors", "students", on_update: :cascade, on_delete: :cascade
  add_foreign_key "belong_tos", "groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "belong_tos", "students", on_update: :cascade, on_delete: :cascade
  add_foreign_key "codes", "departments", on_update: :cascade, on_delete: :cascade
  add_foreign_key "competes", "events", on_update: :cascade, on_delete: :cascade
  add_foreign_key "competes", "groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses", "codes", on_update: :cascade, on_delete: :cascade
  add_foreign_key "curriculums", "departments", on_update: :cascade, on_delete: :cascade
  add_foreign_key "enrollments", "sections", on_update: :cascade
  add_foreign_key "enrollments", "students", on_update: :cascade, on_delete: :cascade
  add_foreign_key "gpas", "students", on_update: :cascade, on_delete: :cascade
  add_foreign_key "leaves", "groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "log_breaks", "rules"
  add_foreign_key "log_breaks", "students", on_update: :cascade, on_delete: :cascade
  add_foreign_key "participates", "events", on_update: :cascade, on_delete: :cascade
  add_foreign_key "participates", "groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "personal_leaves", "leaves", on_update: :cascade, on_delete: :cascade
  add_foreign_key "personnels", "departments", column: "manage_department_id"
  add_foreign_key "personnels", "departments", column: "workin_department_id"
  add_foreign_key "requires", "courses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requires", "curriculums", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schedules", "sections", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schedules", "time_slots"
  add_foreign_key "sections", "courses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sick_leaves", "leaves", on_update: :cascade, on_delete: :cascade
  add_foreign_key "students", "curriculums", on_update: :cascade
  add_foreign_key "teaches", "personnels", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teaches", "sections", on_update: :cascade, on_delete: :cascade
end
