require 'takeaway'

describe Takeaway do

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  context 'when an order is placed' do
    before do
      subject.order_item(1)
    end
    it 'returns the item and cost' do
      expect(subject.order).to include(:dish => "Egg Paneer Kathi Roll", :cost => 4)
    end
  end
end
