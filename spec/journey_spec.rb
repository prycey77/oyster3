require 'journey'

=begin
1.check we store the entry station 
2. check we store the exit station 
3. check if we have completed a journey 
4. check we get a minimum fare for completing a journey 
5. check we get the penalty fare for not completing a journey properly  
=end

describe Journey do
  let(:station) { double :station }

  it 'check we store the entry station' do
    subject.start(station)
    expect(subject.entry_station).to eq station
  end 

  it 'check we store the entry station' do
    subject.finish(station)
    expect(subject.exit_station).to eq station
  end

  it 'check if we have completed a journey' do
    subject.start(station)
    subject.finish(station)
    expect(subject.complete).to eq true 
  end 

  it 'check we get the minimum fare for compelting a journey' do
    subject.start(station)
    subject.finish(station)
    expect(subject.calculate_fare).to eq Journey::MINIMUM_FARE
  end

  it 'check we get penalty fare for not completing a journey' do
    subject.start(station)
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end
  
end