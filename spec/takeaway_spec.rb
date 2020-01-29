require 'takeaway'

describe Takeaway do
  let(:order) { double(:order) }

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  it 'allows an order to be created' do
    subject.create(order)
    expect(subject.order).to eq order
  end
end
