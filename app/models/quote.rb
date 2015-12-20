class Quote < ActiveRecord::Base
    validates :quote_text, presence: true
    validates :quote_from, presence: true
    validates :quote_at, presence: true
end
