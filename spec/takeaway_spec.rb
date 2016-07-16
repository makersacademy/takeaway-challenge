require 'takeaway.rb'

describe Takeaway do

  subject { described_class.new }

  it 'allows customers to see the menu' do
    subject.menu
    expect(subject.menu).to eq Menu::TODAYS_MENU
  end

  it 'allows customers to place an order' do
    subject.add_item
    expect(subject.order).to be_a(Hash)
    expect(subject.order).not_to be_empty
  end

  it 'adds item prices to subtotal' do
    subject.check_order
    expect(subject.check_order).to eq
  end

end
