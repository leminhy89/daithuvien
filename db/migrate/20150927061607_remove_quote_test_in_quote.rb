class RemoveQuoteTestInQuote < ActiveRecord::Migration
  def change
      remove_column :quotes, :quote_test
  end
end
