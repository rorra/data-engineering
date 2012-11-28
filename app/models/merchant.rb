class Merchant
  include Mongoid::Document

  embeds_many :products
  embeds_many :sales

  attr_accessible :address, :name

  field :address, type: String
  field :name, type: String

  validates :address, presence: :true
  validates :name, presence: true, uniqueness: true
end
