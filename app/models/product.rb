class Product
  include Mongoid::Document

  has_many :sales
  belongs_to :merchant

  attr_accessible :product, :description, :price

  field :description, type: String
  field :price, type: Float

  validates :description, presence: true, uniqueness: { scope: :merchant }
  validates :price, presence: :true
end
