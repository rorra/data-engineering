class Sale
  include Mongoid::Document

  attr_accessible :merchant, :product, :quantity, :purchaser, :total_price

  embedded_in :merchant
  embedded_in :product

  field :quantity, type: Integer
  field :purchaser, type: String
  field :total_price, type: Float
end
