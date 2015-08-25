class CheckoutsController < ApplicationController

  def index
    @drinks = Drink.all[0..5]
  end

  def show

    # forward selected drinks
  end

end
