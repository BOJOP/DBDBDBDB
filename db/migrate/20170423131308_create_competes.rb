class CreateCompetes < ActiveRecord::Migration[5.0]
  def change
    create_table :competes do |t|

			t.references :group, null: false
			t.references :event, null: false
		
			t.string :award
			
      t.timestamps
    end
  end
end
