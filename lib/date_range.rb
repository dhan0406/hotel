require 'date'

class DateRange
  attr_reader :in_date, :out_date

  def initialize(in_date, out_date)
    @in_date = Date.parse(in_date)
    @out_date = Date.parse(out_date)

    if out_date <= in_date
      raise ArgumentError.new "Error! Check-out date must be after the check-in date."
    end
  end

  def get_duration
    return @out_date - @in_date
  end

  def range
    return (@in_date..@out_date).to_a
  end
end
