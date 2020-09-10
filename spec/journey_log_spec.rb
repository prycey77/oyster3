require "journey_log"

describe JourneyLog do
  let(:station) {double :station}
  it "Check that journey start equals a new journey object" do
    expect(subject.start(station)).to eq station
  end
  
  let(:journey_class) { double :journey_class, new: journey}

  it "Return an incomplete journey or create a new journey" do
    expect(subject.current_journey).to eq journey
 end

end