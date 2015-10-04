class EventsController < ApplicationController

  def new
  end

  def edit
    @event = Event.find(params[:id])
  end
end
