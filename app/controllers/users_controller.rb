class UsersController < ApplicationController

  def portfolio
    @user_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def friend_search
    if params[:friend].present?
      @friend = User.where(email: params[:friend]).first
      if @friend 
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