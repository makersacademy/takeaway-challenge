require 'price_list'

describe PriceList do
  menu = { pizza: '£6', fries: '£1' }
  let(:subject) { PriceList.new(menu) }

  it 'returns a hash when "list" is called' do
    expect(subject.list).to be_a Hash
  end

  it 'prints each item and price when "print" is called' do
    expect { subject.print }.to output("Pizza: £6\nFries: £1\n").to_stdout
  end
end
