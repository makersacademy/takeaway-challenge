require 'order'

describe Order do

  context 'When asking for the menu' do
    it 'prints the menu on the ouput' do
      expect { subject.asks_menu }.to output.to_stdout
    end
  end

  context 'placing an order' do
    it 'returns a list of dishes when finished' do
      subject.place_order('pancake')
      subject.place_order('Banana_shake')
      subject.place_order('nutella_waffles')
      expect(subject.ordered_list[0]).to eq({ :Pancake => 1.0 })
      expect(subject.ordered_list[1]).to eq({ :Banana_shake => 3.2 })
      expect(subject.ordered_list[-1]).to eq({ :Nutella_waffles => 2.0 })
    end
    it 'can have several orders at once' do
      subject.place_order('pancake', 'Banana_shake', 'nutella_waffles')
      expect(subject.ordered_list[0]).to eq({ :Pancake => 1.0 })
      expect(subject.ordered_list[1]).to eq({ :Banana_shake => 3.2 })
      expect(subject.ordered_list[-1]).to eq({ :Nutella_waffles => 2.0 })
    end
    it 'gives the price of the food' do
      subject.place_order('pancake')
      expect(subject.total_price).to eq(1.0)
    end
    it 'gives the total price when asked for different dishes' do
      subject.place_order('pancake', 'Banana_shake', 'nutella_waffles')
      expect(subject.total_price).to eq(6.2)
    end
  end
end
