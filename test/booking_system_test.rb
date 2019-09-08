require_relative 'test_helper'
require 'pry'

describe "BookingSystem class" do
  before do
    @new_booking_system = BookingSystem.new
  end

  describe "#initialze method" do
    it "can create an instance of BookingSystem" do

    expect(@new_booking_system).must_be_instance_of BookingSystem
    end

    it "can return a list of 20 rooms" do

      expect(@new_booking_system.rooms).must_equal [*1..20]
    end
  end

  describe "#make_reservation method" do
    it "can create a reservation given valid dates" do
      @new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-04'))

      expect(@new_booking_system.reservations[0]).must_be_instance_of Reservation
    end


    it "will raise an error if it tries to book a room that's unavailable" do
      @new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-04'))

      # new_reservation = @new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-03'))

      proc{(@new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-03')))}.must_raise ArgumentError
    end

  end

  describe "#list_reservations method" do
   
    it "can return a list of reservations that include the given date" do
      @new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-04'))

      date = Date.parse('2019-12-04')

      reservation = @new_booking_system.list_reservations(date)

      expect(reservation.room).must_equal 1
    end
  end

  describe "#list_available_rooms method" do
    before do
      @new_booking_system.make_reservation(1, DateRange.new('2019-12-01', '2019-12-04'))
    end

    it "can return a list of available rooms" do
      date_range_one = DateRange.new('2019-12-04', '2019-12-09')
      date_range_two = DateRange.new('2019-11-30', '2019-12-01')

      expect(@new_booking_system.list_available_rooms(date_range_one)).must_equal [*1..20]
      expect(@new_booking_system.list_available_rooms(date_range_two)).must_equal [*1..20]
    end

    it "room one should not be available if dates conflict" do
      date_range = DateRange.new('2019-12-01', '2019-12-02')

      expect(@new_booking_system.list_available_rooms(date_range)).must_equal [*2..20]
    end

  end

end
