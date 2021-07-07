require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, list: { Potato: 1, Hummus: 2 }) }
  let(:ta) { Takeaway.new(menu) }

  describe '#see_menu' do
    it 'should display a list of dishes and prices' do
      expect do
        ta.see_menu
      end.to output("Potato: £1\nHummus: £2\n").to_stdout
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
      expect { ta.complete_order({ 'Potato': 2, 'Hummus': 4 }, 6) }.to raise_error "Incorrect total"
    end

    it 'places the order when the total is correct' do
      sms_class_dbl = class_double('SMS')
      # allow(sms_class_dbl).to receive(:new)
      ta = Takeaway.new(menu, sms_class_dbl)
      ta.place_order('Potato', 2)
      ta.place_order('Hummus', 4)
      expect(sms_class_dbl).to receive(:new)
      ta.complete_order({ 'Potato': 2, 'Hummus': 4 }, 10)
    end
  end

end
