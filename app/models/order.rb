class Order < ApplicationRecord

  # belongs_to :user
  belongs_to :user, optional: true # fix to allow payment
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
