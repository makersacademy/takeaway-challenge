require 'customer'
require 'restaurant'

describe Customer do

  diner = Restaurant.new
  it 'instantiates' do
    expect(subject).to be_instance_of(Customer)
  end

  describe '#make_order' do
    it 'responds' do
      expect(subject).to respond_to(:make_order).with(1).argument
    end

    it 'stores order'do
      subject.make_order({"burger" => 1})
      expect(subject.order).to eq({"burger" => 1})
    end
  end

  describe '#view_menu' do
    it 'shows customer the menu' do
      expect(subject.view_menu).to eq(diner.format_menu)
    end
  end
  
  describe '#validate_bill' do
    it 'customer math matches restuarant bill' do
      subject.make_order({"antipasti" => 3})
      expect(subject.validate_bill(diner.calculate_bill(subject.order))).to eq(21)
    end

    it 'raises error if restaurant bill wrong' do
      dinerdouble = double("dinerdouble")
      subject.make_order({"antipasti" => 3})
      # ugh I sorta hate doubles, they feel sneaky and confusing.
      allow(dinerdouble).to receive(:calculate_bill).and_return(1)
      expect { subject.validate_bill(dinerdouble.calculate_bill(subject.order)) }.to raise_error('bill incorrect')
    end

  end

end
