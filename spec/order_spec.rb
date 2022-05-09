require 'order'

describe Order do
  it 'should create an order with a list for dishes' do
    expect(subject.dishes_list).to be_an(Array)
  end
  describe '#print_out' do
    it 'should print an order created' do
      expect(subject.print_out).to be_truthy
    end
    it 'should check if the order is empty before printing' do
      expect(subject.print_out).to eq("Order is empty")
    end
  end

end