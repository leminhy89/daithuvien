class AddSlugsToStatuses < ActiveRecord::Migration
  def change
      add_column :statuses, :slug, :string
      add_index :statuses, :slug, unique: true
  end
end
