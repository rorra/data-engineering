class Merchant
  include Mongoid::Document

  has_many :products
  has_many :sales

  attr_accessible :address, :name

  field :address, type: String
  field :name, type: String

  validates :address, presence: :true
  validates :name, presence: true, uniqueness: true
end
