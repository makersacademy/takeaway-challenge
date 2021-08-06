require 'takeaway'

describe Takeaway do
  let(:menu) do 
    double 'Menu', items: {
      1 => { name: 'Flat White', price: 2 },
      2 => { name: 'Rainbow Bagel', price: 1 }
    }
  end

  let(:takeaway) { Takeaway.new(menu) }

  let(:test_menu_string) { "1. Flat White: £2\n2. Rainbow Bagel: £1\n" }

  it 'can display a list of dishes with prices' do
    expect { takeaway.show_menu }.to output("#{test_menu_string}\n").to_stdout
  end
end
