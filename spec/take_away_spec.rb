require 'take_away.rb'

describe 'TakeAway' do
subject = TakeAway.new

    it 'Populates an array of hashes with the dish and price when promopted with the dish' do
      expect(subject.order("Spring Rolls")).to be_an_instance_of Array
    end

    it 'Returns the menu and prices when asked' do
    expect(subject.menu).to be_an_instance_of Hash
    end

    it 'returns the total after order has been confirmed when Spring Rolls have been ordered' do
        subject.order("Spring Rolls")
        expect(subject.confirm).to eq 4
    end



  end