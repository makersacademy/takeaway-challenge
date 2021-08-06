require 'takeaway'

describe Takeaway do
  let(:menu) do 
    double 'Menu', items: {
      1 => { name: 'Flat White', price: 2 },
      2 => { name: 'Rainbow Bagel', price: 1 }
    }
  end

  let(:customer) do
    double Customer, order: {
      items: [],
      cost: 0
    },
    phone: '07700900000' 
  end

  let(:test_menu_string) { "1. Flat White: £2\n2. Rainbow Bagel: £1\n" }

  let(:takeaway) { Takeaway.new(menu, customer) }

  it 'can display a list of dishes with prices' do
    expect { takeaway.show_menu }.to output("#{test_menu_string}\n").to_stdout
  end

  it 'allows selecting a number of dishes' do
    (1..2).each { |i| takeaway.add_to_order(i, i) }

    expect(customer.order[:items]).to eq([menu.items[1], [menu.items[2]] * 2].flatten)
  end
end
