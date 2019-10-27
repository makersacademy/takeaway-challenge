require 'menu'

describe Menu do
  items = { pizza: 6, fries: 1 }
  let(:subject) { Menu.new(items) }

  it 'prints each item and price when "print" is called' do
    expect { subject.print }.to output("Pizza: £6\nFries: £1\n").to_stdout
  end

  it 'returns the price for an item when "price" is called' do
    expect(subject.price(:pizza)).to eq 6
  end
end
