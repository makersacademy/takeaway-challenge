require 'takeaway'

describe Takeaway do
  let(:menu) do 
    double 'Menu', items: {
      1 => { name: 'Flat White', cost: 2 },
      2 => { name: 'Rainbow Bagel', cost: 1 }
    }
  end

  let(:customer) { double Customer, order: { items: [], total_cost: 0 } }
  let(:test_menu_string) { "1. Flat White: £2\n2. Rainbow Bagel: £1\n" }
  let(:takeaway) { Takeaway.new(menu, customer) }

  before do
    allow(SMS).to receive(:send).and_return('SMS sent')
    allow_any_instance_of(SMS).to receive(:send).and_return('SMS sent')
  end

  it 'can display a list of dishes with prices' do
    expect { takeaway.show_menu }.to output("#{test_menu_string}\n").to_stdout
  end

  it 'can display the current order' do
    allow(customer)
    .to receive(:order) {
      { items: [1, 1, 2],
        total_cost: 5
      }
    }

    test_string = "\n2 x Flat White\n1 x Rainbow Bagel\n£5\n\n"
    expect { takeaway.show_order }.to output(test_string).to_stdout
  end

  it 'allows selecting a number of dishes' do
    (1..2).each { |i| takeaway.add_to_order(i, i) }

    expect(customer.order[:items]).to eq([1, 2, 2])
  end

  it 'keeps track of the order cost' do
    (1..2).each { |i| takeaway.add_to_order(i, i) }

    expect(customer.order[:total_cost]).to eq(4)
  end

  context 'on checkout' do
    it 'checks the bill is correct' do
      allow(customer)
      .to receive(:order) {
        { items: [1, 2],
          total_cost: 10_000
        }
      }

      expect { takeaway.checkout }.to raise_error('Accounting error')
    end

    it "clears the customer's order" do
      # TODO

      # expect(customer.order[:items]).to be_empty
    end

    it 'sends a text message confirmation' do
      allow(customer).to receive(:order=).with(anything)

      expect(takeaway.checkout).to match(/[sent]/)
    end
  end
end
