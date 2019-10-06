# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_927_200_567) do
  create_table 'instagram_accounts', force: :cascade do |t|
    t.string 'account_handle', limit: 30
    t.boolean 'dog', default: false
    t.boolean 'cat', default: false
  end

  create_table 'lists', force: :cascade do |t|
    t.integer 'head_id'
    t.integer 'tail_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['head_id'], name: 'index_lists_on_head_id'
    t.index ['tail_id'], name: 'index_lists_on_tail_id'
  end

  create_table 'nodes', force: :cascade do |t|
    t.string 'data'
    t.integer 'next_id'
    t.index ['next_id'], name: 'index_nodes_on_next_id'
  end

  create_table 'queues', force: :cascade do |t|
    t.integer 'head_id'
    t.integer 'tail_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['head_id'], name: 'index_queues_on_head_id'
    t.index ['tail_id'], name: 'index_queues_on_tail_id'
  end

  create_table 'remote_controls', force: :cascade do |t|
    t.integer 'television_id', null: false
    t.index ['television_id'], name: 'index_remote_controls_on_television_id'
  end

  create_table 'stacks', force: :cascade do |t|
    t.integer 'head_id'
    t.integer 'tail_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['head_id'], name: 'index_stacks_on_head_id'
    t.index ['tail_id'], name: 'index_stacks_on_tail_id'
  end

  create_table 'televisions', force: :cascade do |t|
    t.boolean 'power', default: false
    t.integer 'volume', default: 0
  end

  create_table 'tree_nodes', force: :cascade do |t|
    t.string 'data'
    t.integer 'parent_id'
    t.index ['parent_id'], name: 'index_tree_nodes_on_parent_id'
  end

  create_table 'trees', force: :cascade do |t|
    t.integer 'root_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['root_id'], name: 'index_trees_on_root_id'
  end

  add_foreign_key 'lists', 'nodes', column: 'head_id'
  add_foreign_key 'lists', 'nodes', column: 'tail_id'
  add_foreign_key 'nodes', 'nodes', column: 'next_id'
  add_foreign_key 'queues', 'nodes', column: 'head_id'
  add_foreign_key 'queues', 'nodes', column: 'tail_id'
  add_foreign_key 'remote_controls', 'televisions'
  add_foreign_key 'stacks', 'nodes', column: 'head_id'
  add_foreign_key 'stacks', 'nodes', column: 'tail_id'
  add_foreign_key 'tree_nodes', 'tree_nodes', column: 'parent_id'
  add_foreign_key 'trees', 'tree_nodes', column: 'root_id'
end
