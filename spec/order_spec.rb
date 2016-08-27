require 'order'

describe Order do
let(:menu_list_class_double) {double :menu_list_class_double, new: menu}
let(:despatch_class_double) {double :despatch_class_couble, new: despatch}
subject(:order) {described_class.new(menu_list_class_double, despatch_class_double)}
let(:menu) {double :menu, :return_list => {"Miso Soup" => 3.5}, :get_price => 3.5}
let(:despatch) {double :despatch, :send_order => nil}

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
    subject.place_order("Miso Soup:2",7)
    expect(despatch).to have_received(:send_order)
  end
end

describe 'edge cases' do
let(:menu) {double :menu, :get_price => nil}

  it 'does not process not existing items' do
    subject.add_to_order("I DONT EXIST", 3)
    expect(subject.current_order).not_to include({"I DONT EXIST" => 3})
  end

  it 'raises error when the order total is incorrect' do
    expect{subject.place_order("Miso Soup:2",3)}.to raise_error(/rejected/)
  end
end

end
