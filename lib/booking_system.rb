require_relative 'date_range.rb'
require_relative 'reservation.rb'
require 'date'

class BookingSystem
  attr_reader :reservations, :rooms
  
  def initialize
    @reservations = []
    @rooms = [*1..20]
  end

  def list_available_rooms(in_date, out_date)
    available_rooms = rooms.clone
    dates = DateRange.new(in_date, out_date)

    @reservations.each do |reservation|
      if reservation.overlap(dates)

      available_rooms.delete(reservation.room)
      end
    end
    return available_rooms
  end
  
  def make_reservation(room, in_date, out_date)
    dates = DateRange.new(in_date, out_date)

    if self.list_available_rooms(in_date, out_date).include?(room)

    reservation = Reservation.new(room: room, date_range: dates)
    @reservations << reservation
    else
      raise ArgumentError.new "Error! That room is unavailable."
    end
  end

  def list_reservations(date)
    list_reservations = []
    @reservations.each do |reservation|
      if reservation.date_range.range.include?(date)
        list_reservations << reservation
      end
    end
    return list_reservations
  end

end
