require 'takeaway'

describe Takeaway do
  let (:menu) { double(:menu, list: {Potato: 1, Hummus: 2}) }

  describe '#see_menu' do
    it 'should display a list of dishes and prices' do
      ta = Takeaway.new(menu)
      actual = ta.see_menu
      expect(actual).to eq "Potato: £1\nHummus: £2\n"
    end
  end

  describe '#place_order' do
    it 'adds the dish and quantity to the order' do
      ta = Takeaway.new(menu)
      ta.place_order('Potato', '2')
      expect(ta.order).to eq({Potato: 2})
    end

    it 'stops customer adding something not on the menu' do
      ta = Takeaway.new(menu)
      expect { ta.place_order('Salmon', '2') }.to raise_error "Sorry we don't do that here"
    end
  end


end