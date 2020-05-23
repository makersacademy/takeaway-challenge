require 'menu'

describe Menu do
  # let(:menu) { { item_number: 1, item: "Nuggets and Chips", price: 3 } }

  it 'responds to new' do
    expect(Menu).to respond_to(:new)
  end

  it 'should have a menu with items in' do
    expect(subject.menu_list).to(include { :item })
  end

  context ' #show_list' do
    let(:expected_output) { ["Costa del Oval Menu",
                             "1. Veggie Burger and Sweet Potato Fries: £3",
                             "2. Veggie Lasagna: £5",   
                             "3. Falafel and Hallumi Wrap: £4"].join("\n") + "\n" 
                          }

    it 'responds to #show_list' do
      expect(subject).to respond_to(:show_list)
    end

    it 'shows entire menu list' do
      expect { subject.show_list }.to output(expected_output).to_stdout
    end
  end

  context ' #select_items' do
    it 'it should responds to #select_items' do
      expect(subject).to respond_to(:select_items).with(1).argument
    end

    it 'raises error if the customer enters an invalid number' do
      expect { subject.select_items(5) }.to raise_error "Invalid number, please choose again"
    end

    it 'returns item name when given customers choice' do
      expect(subject.select_items(1)).to eq("Veggie Burger and Sweet Potato Fries")
    end
  end 
end
