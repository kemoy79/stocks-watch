class StocksController < ApplicationController

  def stock_search
    if params[:symbol].present?
      @stock = Stock.new_lookup(params[:symbol])
      if @stock 
        respond_to do |format|
          format.js { render partial: 'users/shared/results'  }
        end
      else
        respond_to do |format|
          flash.now[:alert]="Enter a valid stock symbol to look up"
          format.js { render partial: 'users/shared/results'  }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert]="Enter a stock symbol to look up"
        format.js { render partial: 'users/shared/results'  }
      end
    end

  end

end