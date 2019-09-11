class DailyAvgMoistureSerializer

  def initialize(days_hash)
    @days_hash = days_hash
  end

  def daily_avg
    {
      data: {
        attributes: @days_hash
      }
    }
  end

end
