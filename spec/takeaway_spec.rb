require 'takeaway.rb'

describe Takeaway do

  subject { described_class.new }

  it 'allows customers to see the menu' do
    subject.show_menu
    expect(subject.show_menu).to eq Menu::TODAYS_MENU
  end

  it 'allows customers to place an order' do
    subject.add_item("pelmeni")
    expect(subject.order).to be_a(Hash)
    expect(subject.order).not_to be_empty
  end

  it 'doesn\'t recognise items which are not on the menu' do
    expect(Menu::TODAYS_MENU.has_key?(:foo)).to eq false
    expect(Menu::TODAYS_MENU.has_key?(:vodka)).to eq true
  end

  it 'adds item prices to subtotal' do
    subject.check_order
    expect(subject.check_order).to eq
  end

end
