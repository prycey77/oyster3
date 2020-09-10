require "journey_log"

describe JourneyLog do
  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:journey_class) { double :journey_class, new: journey}
  it "Check that journey start equals a new journey object" do
    expect(subject.start(station)).to eq station
  end
  
  # it "Starts a journey" do
  #  expect(journey_class).to receive(:new).with(entry_station: station)
  #  subject.start(station)
  # end

   it "records a new journey" do
     allow(journey_class).to receive(:new).and_return journey
   end

   it "should return an incomplete journey or create a new journey" do
    subject.start(station)
    expect(subject.current_journey).to eq station
   end

   

end