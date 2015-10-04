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

  def create
    drinkIds = params["drink-ids"]
    @drinks = []
    if (drinkIds)
      drinkIds.split(',').each do |drinkId|
        @drinks += [Drink.find(drinkId)]
      end
    end
    if @drinks.size > 0
      @menu = Menu.new()
      @menu.drinks = @drinks
      @menu.save()

      @event = Event.new()
      @event.menu = @menu
      @event.save()
      if @event
        # redirect to even create? or event edit?
      end
    end


  end

end
