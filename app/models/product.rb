class Product
  include Mongoid::Document

  embeds_many :sales
  embedded_in :merchant

  attr_accessible :description

  field :description, type: String
  field :price, Float

  validates :description, presence: true, uniqueness: { scope: :merchant }
  validates :price, presence: :true
end
