class JourneyLog
attr_reader :entry_station

    def initialize
      @journey = Journey.new
      @journeys = []
      @current_journey = nil
    end

    def start(station)
      entry_station = @journey.start(station)
      @current_journey.nil? ? createjourney(entry_station) : @journeys
   
    end

    def finish(departure)  
      @journeys << @journey.finish(departure)
    end

    def show_history
      @journeys.dup
    end

  private

    def createjourney(station)
      @journeys << station
      @journey.finish(station)      
    end
 

    def current_journey
      
      @current_journey ||= @journey
      
    end

    def journeys
      
    end 
  

end