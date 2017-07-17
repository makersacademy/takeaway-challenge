require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:order_test) { described_class.new(['broccoli', 'beans']) }
  let(:test_items) { [{ 'broccoli' => '3' }, { 'beans' => '3' }] }
  let(:expected_total) {6}

  it 'has a method to allow customer to select menu items' do
    expect(order).to respond_to :select_items
  end

  it 'returns correct cost of items' do
    order_test.sum_items
    expect(order_test.confirmer.cost).to eq 5
  end

  it '#summarize_order will show list of dishes ordered' do
    order_test.sum_items
    expect { order_test.summarize_order }.to output.to_stdout
  end

end
