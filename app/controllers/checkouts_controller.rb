class CheckoutsController < ApplicationController

  def index
    @drinks = Drink.all[0..5]
  end

  def show
    drinkIds = params[:choices]
    @drinks = []
    drinkIds.each do |drinkId|
      @drinks.push Drink.find(drinkId)
    end

    # @menu = Menu.new(:drinks => @drinks)
  end

end
