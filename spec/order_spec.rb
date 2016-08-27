require 'order'

describe Order do

let(:menu_list_class_double) {double :menu_list_class_double, new: menu}
subject(:order) {described_class.new(menu_list_class_double)}
let(:menu) {double :menu, :return_list => {"Miso Soup" => 3.5}, :get_price => 3.5}
let(:delivery) {double :delivery, :despatch => nil}

describe 'basic functionality' do
  it 'displays a list of available dishes' do
    expect{subject.print_menu}.to output(/Miso Soup £3.5/).to_stdout_from_any_process
  end

  it 'stores input from user of the selected items' do
    subject.add_to_order("Miso Soup", 3)
    expect(subject.current_order).to include({"Miso Soup" => 3})
  end

  it 'calculates total' do
    subject.add_to_order("Miso Soup", 2)
    expect(subject.calculate_total).to eq(7)
  end

  it 'allows to place order as described in the README' do
    subject.place_order({"Miso Soup": 2},7)
    expect(delivery).to have_received(despatch)
  end
end

describe 'edge case for order of non-existing items' do
let(:menu) {double :menu, :get_price => nil}
  it 'does not take not existing items' do
    subject.add_to_order("I DONT EXIST", 3)
    expect(subject.current_order).not_to include({"I DONT EXIST" => 3})
  end
end

end
