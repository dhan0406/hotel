require_relative 'date_range.rb'
require 'date'
require 'pry'

class Reservation
  COST_PER_NIGHT = 200

  attr_reader :id, :room, :date_range

  def initialize(room:, date_range: )
    @room = room
    @date_range = date_range # use of date range?

    if room < 1 || room > 20
      raise ArgumentError.new "That is not a valid room number."
    end
    
  end

  def calculate_total_cost
    return @date_range.get_duration * COST_PER_NIGHT
  end
end

