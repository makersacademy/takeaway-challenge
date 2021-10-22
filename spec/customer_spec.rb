require 'customer'

describe Customer do

  it 'creates a new menu in the current menu list' do
    expect(subject.see_menu).to eq(subject.current_menu)
  end

#check customer can use add and remove items from menu
  it { is_expected.to respond_to(:add_item).with(1).argument }

  it { is_expected.to respond_to(:remove_item).with(1).argument }

  it 'Creates an empty customer order' do
    expect(subject.current_order).to eq([])
    end

end