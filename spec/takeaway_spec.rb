require './lib/takeaway'


describe Takeaway do

let(:menu) {double :fake_menu, new: menu, display_menu: display_menu}
let(:text_manager) {double :fake_text, new: text_manager} #update this
let(:basket_manager) {double :basket_manager, new: menu} #update this


describe '#display_menu' do
  it 'displays the menu' do
    expect(menu).to receive(:display_menu)
    subject.display_menu
  end
end

describe '#add(dish)' do
  it 'adds dishes to the basket' do
    expect(basket_manager).to receive(:add_to_basket).with(1).argument
    subject.display_menu
  end
end

describe '#deduct' do
  it 'removes items from the basket' do
    expect(basket_manager).to receive(:remove_item).with(1).argument
    subject.deduct(removed_item)
  end
end

describe '#confirm_order' do
  it 'confirms the order' do
    expect(basket_manager).to receive(:confirm_order)
    subject.send_text
  end
end

end
