require 'menu'

describe Menu do
  # let(:menu) { {item_number: 1, item: "Nuggets and Chips", price: 3} }

  it 'responds to new' do
    expect(Menu).to respond_to(:new)
  end

   it 'should initialize with a #menu_list' do
    expect(subject.menu_list).to include({item: "Nuggets and Chips"})
  end
  context ' #show_list' do
    it 'responds to #show_list' do
      expect(subject).to respond_to(:show_list)
    end
  end

  context ' menu_list' do
    it 'shows menu_list' do
      expect(subject.show_list).to eq("1. Nuggets and Chips: £3")
    end
  end
end
