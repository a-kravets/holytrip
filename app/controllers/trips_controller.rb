  class TripsController < ApplicationController
  # before_action :set_trip, only: [:show, :edit, :destroy, :update]

  def index
    @trips = Trip.where(user: current_user)
  end

  def show
  end

  def new
    @trip = Trip.new
    @participant = Participant.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      entries = params["emails"]
      entries.each do |email|
        unless email == ""
          part = Participant.new(email: email, trip: @trip, status: "incomplete")
          part.save
        end
      end
      redirect_to trip_tasks_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.attachments.destroy_all
    @trip.tasks.destroy_all
    @trip.participants.destroy_all
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date, :photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
