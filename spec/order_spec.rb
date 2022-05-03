require 'order'

describe Order do

  it 'creates an instance of Order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'has a default empty hash to store customer\'s order' do
    expect(subject.customer_order).to eq Hash.new(0)
  end

  describe '#add_dish' do

    it 'adds a dish to customer\'s order' do
      expect { subject.add_dish('Burger') }.to change { subject.customer_order }.from(Hash.new(0)).to ({ 'Burger' => 5 })
    end

    it 'stores a dish in the customer\'s order' do
      subject.add_dish('Burger')
      expect(subject.customer_order).to include('Burger')
    end
  end

  describe '#view_order' do

    context 'customer\'s order contains dishes' do
      before(:each) { subject.add_dish('Burger') }
      before(:each) { subject.add_dish('Chips') }
      before(:each) { subject.add_dish('Wings') }

      it 'prints dishes from the customer\'s order with quantities, prices and total' do 
        # using a HEREdoc
        expect { subject.view_order }.to output(<<-order
1x Burger £5
1x Chips £3
1x Wings £3
==========
TOTAL: £11
order
        ).to_stdout
      end

    end
  end
end 
