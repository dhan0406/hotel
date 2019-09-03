class Reservation
  attr_reader  :room_num, :total_cost
  attr_accessor 
  
  def initialize(room_num:, total_cost:)
  @room_num = room_num
  @total_cost = total_cost
  end
end