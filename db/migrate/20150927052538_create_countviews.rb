class CreateCountviews < ActiveRecord::Migration
  def change
    create_table :countviews do |t|
      t.integer :book_id
      t.integer :count_num
      t.boolean :delete_flag

      t.timestamps null: false
    end
  end
end
