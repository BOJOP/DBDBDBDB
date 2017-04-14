class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|

      t.string :rule_detail, null: false
      t.integer :behavior_score_reduction, null: false

      t.timestamps
    end
  end
end
