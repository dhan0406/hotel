require_relative 'test_helper'

describe "DateRange class" do
  describe "#initialize method" do
    
    it "can be initialized with two dates" do
      date_range = DateRange.new('2019-12-01', '2019-12-04')

      expect(date_range.in_date).must_equal Date.parse('2019-12-01')
      expect(date_range.out_date).must_equal Date.parse('2019-12-04')
    end

    it "raises an error for invalid check-in and check-out dates" do
     
      proc {DateRange.new('2019-12-01', '2019-11-11')}.must_raise ArgumentError
    end
  end

  describe "#get_duration method" do
    it "can return the duration of the date range" do
      date_range = DateRange.new('2019-12-01', '2019-12-04')

      expect(date_range.get_duration).must_equal 3
    end
  end

  describe "#range method" do
    it "returns an arary of dates" do
      date_range = DateRange.new('2019-12-01', '2019-12-04')
  
      expect(date_range.range).must_be_kind_of Array
    end
  end
end



