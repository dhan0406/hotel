require_relative 'date_range.rb'
require_relative 'reservation.rb'
require 'date'

class BookingSystem
  attr_reader :reservations, :rooms
  
  def initialize
    @reservations = []
    @rooms = [*1..20]
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
  
  def make_reservation(room, date_range)
    # if 'room' is in the 'list of available rooms', create a reservation, else raise Error

    if self.list_available_rooms(date_range).include?(room)

    reservation = Reservation.new(room: room, date_range: date_range)
    @reservations << reservation
    else
      raise ArgumentError "Error! That room is unavailable."
    end
  end

  def list_reservations(date)
    @reservations.each do |reservation|
      if reservation.date_range.range.include?(date)
        return reservation
      end
    end
  end

end
