require 'date'

class BookingsController < ApplicationController
  before_action :booking_params, only: [:create]

  def new
    @booking = Booking.new
  end

  def create	

  	if not current_user
  		redirect_to login_path, notice: "You have to be logged-in to book a table!"
  		return
  	end

  	table = RestaurantTable.find(booking_params[:table_id])

  	# Validity checks
  	n_guests = booking_params[:number_of_guests].to_i

  	if n_guests <= 0 || n_guests > table.capacity # Fix to check for table's capacity
  		# render error
  		flash.now[:error] = "Invalid Number of Guests"
  		render :new
  		return
  	end

  	booking_date = booking_params[:date]

  	begin
  		Date.parse(booking_date)
  	rescue ArgumentError
  		flash.now[:error] = "Invalid Date"
  		render :new
  		return
  	end

    @booking = Booking.new(user: current_user, restaurant_table: table,
    	:date => booking_params[:date],
    	:number_of_guests => booking_params[:number_of_guests])
    
    if @booking.save
      table.update(:available => false)
      redirect_to root_path, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  def show
    if current_user
      @bookings = current_user.bookings
    else
      redirect_to login_path, notice: "You need to be logged in to view your bookings."
    end
  end

  private

  def booking_params
    params.permit(:date, :number_of_guests, :user_id, :table_id)
  end

end
