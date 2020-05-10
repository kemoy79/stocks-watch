class UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:symbol])

    if stock.blank?
      stock = Stock.new_lookup(params[:symbol])
      stock.save
    end

    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "#{stock.name} was added to your portfolio"
    redirect_to portfolio_path
  end

  def destroy
    stock  = Stock.find(params[:id])

    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy

    flash[:notice] = "#{stock.name} was successfuly removed form your portfolio!"
    redirect_to portfolio_path



  end
  
end
