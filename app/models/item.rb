class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category, :status, :postage, :prefecture, :preparation_day
  validates :image, :name, :introduction, :category, :status, :postage, :preparation_day, :price, :prefecture, presence: true
  validates :category_id, :status_id, :postage_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }
end
