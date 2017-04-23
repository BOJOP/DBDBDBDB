class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
			
			t.date :date
			t.string :explanation
			t.string :name
			
			t.boolean :isActivity
			t.boolean :isCompetition
			
      t.timestamps
    end
  end
end
