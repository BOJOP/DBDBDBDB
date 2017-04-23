class CreateTeaches < ActiveRecord::Migration[5.0]
  def change
    create_table :teaches do |t|

			t.references :personnel, null: false
			t.references :section, null: false
		
      t.timestamps
    end
  end
end
