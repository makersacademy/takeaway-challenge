require 'takeaway'

describe Takeaway do

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  context 'when one dish is ordered' do
    before do
      subject.order_item(1)
    end

    it 'returns the item and cost' do
      expect(subject.order).to include(:dish => "Egg Paneer Kathi Roll", :cost => 4)
    end

    it 'shows the total cost of the order' do
      expect(subject.total_cost).to eq 4
    end
  end
end
