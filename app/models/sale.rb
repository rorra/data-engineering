class Sale
  include Mongoid::Document

  attr_accessible :merchant, :product, :quantity, :purchaser, :total_price

  belongs_to :merchant
  belongs_to :product

  field :quantity, type: Integer
  field :purchaser, type: String
  field :amount, type: Float

  before_create :calculate_amount

  private

  def calculate_amount
    self.amount = self.product.price * self.quantity
  end
end
