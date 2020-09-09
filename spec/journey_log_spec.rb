require "journey_log"

describe JourneyLog do
  let(:station) {double :station}
  it "Check that journey start equals a new journey object" do
    expect(subject.start(station)).to eq station
  end
end