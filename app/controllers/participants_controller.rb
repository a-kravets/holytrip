class ParticipantsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.new(email: params[:email], status: "pending")
    @participant.trip = Trip.find(params[:trip_id])
    random_pass = SecureRandom.hex(10)
    user = User.create(email: params[:email], password: random_pass, password_confirmation: random_pass)
    @participant.user = user
    if @participant.save
      redirect_to trip_tasks_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.user = current_user
    @participant.update(participant_params)
    redirect_to trip_tasks_path(@trip)
  end

  private

  # def participant_params
  #   params.require(:participant).permit(:status)
  # end

  def email
   params[:email]
  end
end
