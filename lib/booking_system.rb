require_relative 'date_range.rb'
require_relative 'reservation.rb'
require 'date'

class BookingSystem
  attr_reader :reservations, :rooms
  
  def initialize
    @reservations = []
    @rooms = [*1..20]
  end

  # given the valid date range, can create an instance of reservation by assigning first available room to reservation
  

  def make_reservation(room, date_range)
    reservation = Reservation.new(room: room, date_range: date_range)
    @reservations << reservation


    # if 'room' is not included in the list of 'available rooms', raise an error
  else
    # create a reservation with given

  

  end

  def find_available_room(date_range)
    # if #date_range.overlap? returns false, create a Reservation by assigning a room 
     
  end

  def list_reservations(date)
    @reservations.each do |reservation|
      if reservation.date_range.range.include?(date)
        return reservation
      end
    end
  end

  def list_available_rooms(date_range)
    available_rooms = rooms.clone

    @reservations.each do |reservation|
      unless ((date_range.out_date <= reservation.date_range.in_date || date_range.in_date >= reservation.date_range.out_date))

      available_rooms.delete(reservation.room)
      end
      
      return available_rooms
    end
  end
end
