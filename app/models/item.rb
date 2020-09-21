class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users_item
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image, :name, :introduction, :category_id, :status_id, :postage_id, :prefecture_id, :preparation_day_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  validates :category_id, :status_id, :postage_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :name, length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
