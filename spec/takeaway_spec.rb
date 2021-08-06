require 'takeaway'

describe Takeaway do
  let(:menu) do 
    double 'Menu', items: {
      1 => { name: 'Flat White', price: 2 },
      2 => { name: 'Rainbow Bagel', price: 1 }
    }
  end

  let(:customer) { double Customer, phone_number: '07700900000', cart: [] }
  let(:takeaway) { Takeaway.new(menu, customer) }
  let(:test_menu_string) { "1. Flat White: £2\n2. Rainbow Bagel: £1\n" }

  it 'can display a list of dishes with prices' do
    expect { takeaway.show_menu }.to output("#{test_menu_string}\n").to_stdout
  end

  it 'allows selecting a number of dishes' do
    (1..2).each { |i| takeaway.add_to_cart(i) }

    expect(customer.cart).to include(menu.items[1], menu.items[2])
  end
end
