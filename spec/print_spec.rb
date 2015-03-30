require 'print'

describe Print do
  let(:order) { double(:order) }
  let(:menu) { double(:menu) }

  it 'can show on the screen the contents of order' do
    allow(order).to receive(:items) { { 'Pepperoni' => 9.95 } }
    allow(order).to receive(:total_items) { 1 }
    allow(order).to receive(:cost) { 9.95 }
    expect { subject.check(order) }.to output.to_stdout
  end

  it 'can show on the screen the contents of menu' do
    allow(menu).to receive(:items) { { 1 => { dish: 'Seafood', price: 9.95 } } }
    expect { subject.read(menu) }.to output.to_stdout
  end
end
