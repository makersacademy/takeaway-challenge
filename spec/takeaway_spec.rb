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

  it 'allows selecting a number of dishes' do
    (1..2).each { |i| takeaway.add_to_order(i, i) }

    expect(customer.order[:items]).to eq([menu.items[1], [menu.items[2]] * 2].flatten)
  end

  it 'keeps track of the order cost' do
    (1..2).each { |i| takeaway.add_to_order(i, i) }

    expect(customer.order[:total_cost]).to eq(4)
  end

  it 'sends an order confirmation text' do
    expect(takeaway.send_confirmation).to match(/[sent]/)
  end
end
