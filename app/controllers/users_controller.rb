class UsersController < ApplicationController
  before_action :authenticate_user!

  def portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks 
  end
  

  def friend_search
    if params[:friend].present?
      @friends = User.find_friend('email', params[:friend])
      @friends = current_user.exclude_current_user(@friends)
      if !@friends.empty? 
        respond_to do |format|
          format.js { render partial: 'friends/result'  }
        end
      else
        respond_to do |format|
          flash.now[:alert]="Enter a valid email to look up"
          format.js { render partial: 'friends/result'  }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert]="Enter a friend email to look up!"
        format.js { render partial: 'friends/result'  }
      end
    end

  end

end