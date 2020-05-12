class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_in_portfolio?(symbol)
    stock = Stock.check_db(symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def can_add_stock?(symbol)
    under_stock_limit? && !stock_in_portfolio?(symbol)
  end

  def self.find_friend(field, param)
    where("#{field} like ?", "%#{param.strip}%")
  end

  def exclude_current_user(users)
    users.reject { |user| user.id == self.id }
  end


  def friends_with?(friend_id)
    self.friends.where(id: friend_id).exists?
  end
end
