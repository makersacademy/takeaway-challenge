require 'print'

describe Print do
  let(:order) { double(:order) }
  it 'can show on the screen the contents of order' do
    allow(order).to receive(:items) { { 'Lmb Bhuna' => 6.95 } }
    allow(order).to receive(:total_items) { 1 }
    allow(order).to receive(:cost) { 6.95 }
    expect { subject.check(order) }.to output.to_stdout
  end
end
