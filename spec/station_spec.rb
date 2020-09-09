require "station"

describe Station do
  subject {Station.new("Stratford", 2)}

  it "returns the name of the station" do
    expect(subject.name).to eq "Stratford"
  end
  it "returns the zone of the station" do
    expect(subject.zone).to eq 2 
  end
end