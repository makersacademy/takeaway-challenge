require './lib/order.rb'
describe Order do
  it 'let you select items from the menu' do
    expect{ subject.select_item("Pad_thai") }.to change { subject.my_order }.to ["Pad_thai"]
  end

end
