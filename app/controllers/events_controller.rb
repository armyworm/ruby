class EventsController < ApplicationController
	def index
  	@events = Event.page(params[:page]).per(5)
	end

	def new
		@event = Event.new
	end

	def create
  		@event = Event.new(event_params)
  		@event.save

  		redirect_to :action => :index
  		flash[:notice] = "event was successfully created"
	end

	def show
  		@event = Event.find(params[:id])
	end

	def edit
  		@event = Event.find(params[:id])
	end

	def update
  		@event = Event.find(params[:id])
  		@event.update(event_params)

  		redirect_to :action => :show, :id => @event
  		flash[:notice] = "event was successfully updated"
	end

	def destroy
  		@event = Event.find(params[:id])
  		@event.destroy

  		redirect_to :action => :index
  		flash[:alert] = "event was successfully deleted"
	end

private

	def event_params
  		params.require(:event).permit(:name, :description)
	end
end
