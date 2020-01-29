require 'takeaway'

describe Takeaway do
  let(:item) { double(:item) }

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  it 'allows an order to be created' do
    subject.create_order(item)
    expect(subject.order).to eq item
  end
end
