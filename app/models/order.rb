class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :users_item
  validates :token, presence: true
end
