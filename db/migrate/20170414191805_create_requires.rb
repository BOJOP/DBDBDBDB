class CreateRequires < ActiveRecord::Migration[5.0]
  def change
    create_table :requires do |t|

      t.references :curriculum, null: false
      t.references :course, null: false
      
      t.timestamps
    end
  end
end
