require 'order'

RSpec.describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :fake_menu => :fake_value, "pizza" => 5, "fish" => 7}

  it 'confirms line of order' do
    expect{subject.add_to_order("pizza", 1)}.to output("1 x pizza added to your order.").to_stdout
  end

  it 'can total an order' do
    subject.add_to_order("pizza", 2)
    subject.add_to_order("fish", 1)
    expect(subject.total_order).to eq(17)
  end

  end
