class AddQuoteTextToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :quote_text, :text
  end
end
