require 'order'

RSpec.describe Order do
  let(:dish) { instance_double Dish, name: "Tikka Masala", price: 10.99 }
  let(:dish2) { instance_double Dish, name: "Burger", price: 7.99 }
  let(:receipt) { instance_double Receipt, print: [["Tikka Masala - £10.99"], ["Burger - £7.99"], "Total: £18.98"] }
  describe '#select' do
    it 'adds an item to the order' do
      subject.select(dish)
      expect(subject.items).to eq [dish]
    end
    it 'adds multiple items to the order' do
      subject.select(dish)
      subject.select(dish2)
      expect(subject.items).to eq [dish, dish2]
    end
  end
  describe '#total' do
    it 'returns the total of an order of one dish' do
      subject.select(dish)
      expect(subject.total).to eq 10.99
    end
    it 'returns the total of an order of multiple dishes' do
      [dish, dish2].each do |x|
        subject.select(x)
      end
      expect(subject.total).to eq 18.98
    end
  end
  describe '#print_receipt' do
    it 'returns an itemised receipt with a total' do
      [dish, dish2].each do |x|
        subject.select(x)
      end
      expect(subject.print_receipt).to eq [["Tikka Masala - £10.99"], ["Burger - £7.99"], "Total: £18.98"]
    end
  end

end
