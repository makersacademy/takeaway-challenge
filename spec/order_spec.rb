require 'order'

describe Order do
  let(:order) { Order.new }
  let(:mock_menu) { double({ 'chicken tikka massala' => 6, 'hawaian pizza' => 6 }) }
  # allow(:mock_menu).to respond_to(:map)

  it 'creates an instance of the Order class' do
    expect(order).to be_instance_of(Order)
  end

  it 'begins with an empty trolley' do
    expect(order.trolley).to be_empty
  end

  describe '.add_item method' do
    it 'takes two arguments' do
      expect(order).to respond_to(:add_item).with(2).arguments
    end

    it 'adds an item to the trolley' do
      expect { order.add_item('chicken tikka massala', 2) }.to change{ order.trolley.length }.by(1)
    end
  end

  # test needs fixing - wrong output
  describe '.trolley_summary' do
    it 'gives total summary for each item ordered' do
      # mock_menu.should_receive(:each)
      order.add_item("chicken tikka massala", 2)
      summary = mock_menu.each do |k, v|
        order.trolley.each do |key, val|
          if k == key
            "#{k}, £#{v*val}"
          end
        end
      end
      expect(summary).to eq('chicken tikka massala, £12')
    end
  end

  # test needs fixing - wrong output
  describe '.total_bill method' do
    it 'gives the total bill' do
      order.add_item("chicken tikka massala", 2)
      total = mock_menu.each do |k, v|
        order.trolley.each do |key, val|
          if k == key
            "Total: £#{v*val}"
          end
        end
      end
      expect(total).to eq('Total: £12')
    end
  end
end
