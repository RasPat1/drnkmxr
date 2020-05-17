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
  end

  def create_menu
    drinkIds = params["drink-ids"]
    @drinks = []
    if (drinkIds)
      drinkIds.split(',').each do |drinkId|
        @drinks += [Drink.find(drinkId)]
      end
    end
    if @drinks.size > 0
      @menu = Menu.new
      @menu.drinks = @drinks
      @menu.save
      if (@menu)
        redirect_to action: :create_event
      end
    end

  end

  def create_event

  end

  def login
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
      @menu = Menu.new
      @menu.drinks = @drinks
      @menu.save
      if (@menu)
        redirect_to new_event_path(:menu_id => @menu)
      end
    end

  end

  def edit
  end

end
