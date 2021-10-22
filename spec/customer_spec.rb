require 'customer'

describe Customer do

  it 'shows the current menu list' do
    expect(subject.see_menu).to eq(subject.current_menu)
  end

#check customer can use add and remove items from menu
  it { is_expected.to respond_to(:add_item).with(1).argument }

  it { is_expected.to respond_to(:remove_item).with(1).argument }
end