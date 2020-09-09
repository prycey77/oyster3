require 'oyster_card'

describe OysterCard do
    let(:station) { double :station }
    let(:exit_station) { double :exit_station }

    it "Balance of oyster card equals 0" do
        expect(subject.balance).to eq 0
    end
    
    it "Top up oyster card with £2" do
        expect{subject.top_up(2)}.to change{(subject.balance)}.by(2)
    end
    
    it "Limit for oyster card £90" do
        limit = OysterCard::OYSTER_LIMIT
        subject.top_up(limit)  
       expect{subject.top_up(90) }.to raise_error("Maximum Limit")      
    end 

    it "Deduct £2 from oyster card" do
        subject.top_up(10)
        expect{subject.send(:deduct, 5)}.to change{(subject.balance)}.from(10).to(5)
    end

    it "Touch in oyster should show true for in_journey?" do
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.in_journey?).to be true
    end

    it "Touch out oyster should show false for in_journey?" do
        subject.touch_out('stratford')
        expect(subject.in_journey?).to be false
    end    

    it "does oyster card show error if there is no balance" do
        expect{subject.touch_in(station)}.to raise_error"No Money"
    end

    it 'we have the correct balance after touching out' do 
      expect {subject.touch_out('stratford')}.to change{(subject.balance)}.by(-(OysterCard::MINIMUM_LIMIT))
    end 

    it "store entry station" do
        subject.top_up(10)
        subject.touch_in(station)
    expect(subject.entry_station).to eq station
    end

    it "checks that a new oyster has no journeys by default" do
      expect(subject.journeys).to eq ({})
    end 

    it 'check that touching in and out gives one journey' do 
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to eq ({station => exit_station})
    end 

end    