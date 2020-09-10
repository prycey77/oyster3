class JourneyLog


    def initialize(journey_class = Journey.new)
      @journey = journey_class
      @journeys = []
    end

    def start(station)
      @journey.start(station) 
    end

    def current_journey
      @journey
    end

end