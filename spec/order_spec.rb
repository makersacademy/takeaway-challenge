require 'order'

RSpec.describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :fake_menu => :fake_value, "pizza" => 5, "fish" => 7}

  it 'confirms line of order' do
    expect{subject.add_to_order("pizza", 1)}.to output("1 x pizza added to your order.").to_stdout
  end

  end
