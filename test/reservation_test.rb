require_relative 'test_helper'

describe "Reservation class" do
  describe "#initialize method" do
    before do
      @reservation = Reservation.new(
        room: 1,
        date_range: DateRange.new('20191201', '20191204')
      )
    end

    it "is an instance of Reservation" do
      expect(@reservation).must_be_instance_of Reservation
    end
    
    it "has a valid room number" do
      expect(@reservation.room).must_be_kind_of Integer
    end

    it "raises an ArgumentError if the system tries to reserve an invalid room" do
      proc{ Reservation.new(room: 21)}.must_raise ArgumentError
    end
  end

  describe "#calculate_total_cost method" do
    it "calculates the total cost of stay" do

      reservation = Reservation.new(
        room: 1,
        date_range: DateRange.new('20191201', '20191204')
      )

      expect(reservation.calculate_total_cost).must_equal 600
    end
  end
end
