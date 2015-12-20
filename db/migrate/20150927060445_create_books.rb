class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :category_id
      t.integer :type_id
      t.integer :author_id
      t.integer :status_id
      t.integer :countview_id
      t.string :image
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.boolean :delete_flag

      t.timestamps null: false
    end
  end
end
