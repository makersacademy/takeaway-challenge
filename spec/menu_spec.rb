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
    let(:expected_output) { ["Costa del Oval",
    "1. Veggie Burger and Sweet Potato Fries : £3",
    "2. Veggie Lasagna: £5",   
    "3. Falafel and Hallumi Wrap: £4"].join("\n") + "\n" }

    it 'responds to #show_list' do
      expect(subject).to respond_to(:show_list)
    end

    it 'shows entire menu list' do
      expect { subject.show_list }.to output(expected_output).to_stdout
    end
  end

  context ' #select_items' do
    it 'it should responds to #select_items' do
      expect(subject).to respond_to(:select_items)
    end

    it 'asks customer for an items to add to their order' do
      expect(subject.select_items).to eq('What would you like to order? Enter an item number.')
    end
  end 
end
