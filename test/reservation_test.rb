require_relative 'test_helper'

describe "Reservation class" do
  describe "Reservation instantiation" do
    before do
      @reservation = Reservation.new(
        room_num: 1,
        total_cost: 200
      )
    end

    it "is an instance of Reservation" do
    expect(@reservation).must_be_kind_of Reservation
    end
    
  end
end
