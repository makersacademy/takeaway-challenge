require 'basket'
require 'dish'

describe Basket do
  let(:dish1) { instance_double(Dish, :name => "burger", :price => 4.00) }
  let(:dish2) { instance_double(Dish, :name => "chips", :price => 2.50) }
  let(:dish3) { instance_double(Dish, :name => "pepsi", :price => 1.00) }

  describe '#add_to_basket' do
    it 'can add dish items to @in_basket' do
      expect { subject.add_to_basket(dish1) }.to change { subject.in_basket.length }.by(1)
    end

    it 'adds the dish price to running total' do
      expect { subject.add_to_basket(dish1) }.to change { subject.total }.by(4.00)
    end
  end

  describe '#remove_from_basket' do
    before do
      subject.add_to_basket(dish1)
    end
    it 'can add remove items from @in_basket' do
      expect { subject.remove_from_basket(dish1) }.to change { subject.in_basket.length }.by(-1)
    end

    it 'deducts the price from the running total' do
      expect { subject.remove_from_basket(dish1) }.to change { subject.total }.by(-4.00)
    end
  end

  describe '#view_basket' do
    it 'displays all current items in basket and current total.' do
      subject.add_to_basket(dish1)
      subject.add_to_basket(dish2)
      subject.add_to_basket(dish3)
      
      expect(subject.view_basket).to eq "burger: £4.00\nchips: £2.50\npepsi: £1.00\nTotal: £7.50"
    end
  end

  describe '#get_format_total' do
    it 'returns the total as a formatted string: £xx.xx' do
      subject.add_to_basket(dish1)
      subject.add_to_basket(dish2)
      subject.add_to_basket(dish3)
      
      expect(subject.get_format_total).to eq "Total: £7.50"
    end
  end
end