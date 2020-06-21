require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, list: { Potato: 1, Hummus: 2 }) }
  let(:ta) { Takeaway.new(menu) }

  describe '#see_menu' do
    it 'should display a list of dishes and prices' do
      actual = ta.see_menu
      expect(actual).to eq "Potato: £1\nHummus: £2\n"
    end
  end

  describe '#place_order' do
    it 'adds the dishes and quantities to the order' do
      ta.place_order('Potato', 2)
      ta.place_order('Hummus', 4)
      expect(ta.order).to eq({ "Potato" => 2, "Hummus" => 4 })
    end

    it 'stops customer adding something not on the menu' do
      expect { ta.place_order('Salmon', 2) }.to raise_error "Sorry we don't do that here"
    end

    it 'only allows positive quantities of food' do
      expect { ta.place_order('Potato', -4) }.to raise_error "Are you having a laugh?!"
    end

    it 'only allows integer quantities of food' do
      expect { ta.place_order('Potato', 5.6) }.to raise_error "Please order whole dishes only, thanks"
    end
  end

  describe '#check_total' do
    it 'returns the current total of the order' do
      ta.place_order('Potato', 2)
      ta.place_order('Hummus', 4)
      expect(ta.check_total).to eq 10
    end

    it 'returns 0 when an order has not been placed' do
      expect(ta.check_total).to eq 0
    end
  end

  describe '#complete_order' do
    it 'raises an error if the order total is incorrect' do
      expect { ta.complete_order({'Potato': 2, 'Hummus': 4}, 6) }.to raise_error "Incorrect total"
    end

    it 'places the order when the total is correct' do
      ta.place_order('Potato', 2)
      ta.place_order('Hummus', 4)
      ta.complete_order({'Potato': 2, 'Hummus': 4}, 10)
      mock = mock(Twilio::REST::Client)
      twapi = mock('Instantiated TW API')
      mock.should_receive(:new).once.with(any_args()).and_return(twapi)

    end
  end

end
