require 'order'

describe Order do

  subject { Order.new(menu) }

  let(:menu) { double(:menu, return_dish: { dish: :chicken, value: 7.5 }) }

  it 'should start and order' do
    expect(subject.order).to eq([])
  end

  context 'adding to order' do

    before do
      subject.add(:chicken, 2)
      allow(subject).to receive(:two_decimals) { '15.00' }
    end

    it 'should add dishes to order with quantity' do
      expect(subject.order).to include({ dish: :chicken, amount: 2, price: 7.5 })
    end

    it 'will just update quantity when adding a dish already in order' do
      2.times { subject.add(:chicken, 1) }
      expect(subject.order).to eq([{ dish: :chicken, amount: 4, price: 7.5 }])
    end

    it 'will remove an order' do
      subject.remove(:chicken, 2)
      expect(subject.order).to be_empty
    end

    it 'will just update quantity if remove quantity is less than order total' do
      subject.remove(:chicken)
      expect(subject.order).to include({ dish: :chicken, amount: 1, price: 7.5 })
    end

    it 'will error if you try to remove dish not in order' do
      expect { subject.remove(:beef) }.to raise_error("beef not in order")
    end

    it 'will show order' do
      expect { subject.view_order }.to output("chicken x2 £15.00\nTotal: £15.00\n").to_stdout
    end

  end

end
