class JourneyLog
attr_reader :entry_station

    def initialize(journey_class = Journey )
      @journey = journey_class.new
      @journeys = []
      @entry_station = entry_station
    end

    def start(station)
     @entry_station = @journey.start(station) 
     @entry_station
    end

    def current_journey
      @journey
    end

end