require 'menu'

describe Menu do
  let(:menu) { {item_number: 1, item: "Nuggets and Chips", price: 3} }

  it 'responds to new' do
    expect(Menu).to respond_to(:new)
  end

  it 'should have a menu with items in' do
    expect(subject.menu_list).to(include { :item })
  end

  context ' #show_list' do
    it 'responds to #show_list' do
      expect(subject).to respond_to(:show_list)
    end

    it 'outputs the name of the restaurant before the menu' do
      expect { subject.show_list }.to output {"Costa del Oval"}.to_stdout
    end

    it 'shows entire menu list' do
      menu_list = {item_number: 1, item: "Nuggets and Chips", price: 3}
    expect { subject.show_list }.to output { "1. Nuggets and Chips: £3/n 2. Veggie Lasagne: £5" }.to_stdout
    end
  end
end
