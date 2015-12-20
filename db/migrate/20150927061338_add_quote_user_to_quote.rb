class AddQuoteUserToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :quote_from, :string
    add_column :quotes, :quote_at, :string
  end
end
