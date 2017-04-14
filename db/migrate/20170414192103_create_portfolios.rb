class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|

      t.date :date, null: false
      t.string :explanation
      t.string :name, null: false
      
      t.references :group, null: false
      
      t.timestamps
    end
  end
end
