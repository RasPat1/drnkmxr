class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.menu = @menu
    @event.save
  end

  def edit
    @event = Event.find(params[:id])
    @event.guests = params[:guests]
    @event.hours = params[:hours]
    @event.event_date = params[:event_date]
    @event.save

  end
end
