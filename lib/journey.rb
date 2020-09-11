class Journey

attr_reader :entry_station, :exit_station, :fare
MINIMUM_FARE = 1
PENALTY_FARE = 6
  
  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end 

  #record starting station 
  def start(station)
    @entry_station = station 
  end

  #record the finish station 
  def finish(station)
    @exit_station = station 
  end 

  #tell us if we have compelted a journey 
  def complete
   @entry_station != nil && @exit_station != nil ? true : false
  end 

  #calculate the fare 
  def calculate_fare
    @entry_station.zone - @exit_station.zone
    complete == true ? @fare = MINIMUM_FARE : @fare = PENALTY_FARE
  end 

end 