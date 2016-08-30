require 'takeaway.rb'

describe Takeaway do

  subject { described_class.new }

  it 'allows customers to see the menu' do
    subject.show_menu
    expect(subject.show_menu).to eq Menu::TODAYS_MENU
  end

  it 'allows customers to place an order' do
    subject.add_item('pelmeni', 2)
    expect(subject.order).to be_a(Hash)
    expect(subject.order).not_to be_empty
  end

  it 'doesn\'t recognise items which are not on the menu' do
    expect(Menu::TODAYS_MENU.has_key?(:foo)).to eq false
    expect(Menu::TODAYS_MENU.has_key?(:vodka)).to eq true
  end

  it 'raises an error when item is not on the menu' do
    expect{subject.add_item('foo', 2)}.to raise_error "Sorry, we do not have this on our menu"
  end

  it 'adds item prices to total' do
    subject.add_item('pelmeni', 1)
    subject.add_item('vodka', 2)
    expect(subject.order_total).to eq 10
  end

end
