class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
        t.string :name
        t.string :created_by
        t.string :updated_by
        t.boolean :delete_flag
        t.timestamps null: false
    end
  end
end
