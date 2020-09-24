class UserItem
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :users_item_id, :user_id, :item_id
  with_options presence: true do
    validates :token, :city, :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "can't be blank" }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, length: { maximum: 11 }

  def save
    @users_item = UsersItem.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, users_item_id: @users_item.id)
  end
end
