class JourneyLog

    def initialize(journey_class = Journey.new)
      @journey = journey_class
    end

    def start(station)
      @journey.start(station) 
    end


end