class JourneyLog
attr_reader :entry_station, :journeys

    def initialize(journey = Journey.new)
      @journey = journey
      @journeys = []
    end

    def start(station)
     @entry_station = @journey.start(station) 
     @journeys << @entry_station
    end

    def finish(station)
      @exit_station = @journey.finish(station) 
      @journeys << @exit_station
    end

    def journeys

      @journeys.dup
    
    end

  private

    def current_journey
      if !@exit_station.nil?
        @current_journey = nil
      else
      @current_journey ||= @journey
      end
    end

end