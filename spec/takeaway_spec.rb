require './lib/takeaway'
#require './lib/menu'

describe Takeaway do
  let(:menu) {double(:menu, menu_items: menu_items)  }
  let(:menu_items) { { 'Burger' => 1,
  'chips' => 2,
  'chicken' => 3,
  'drink' => 1
    } }


describe '#print_menu'do
  it 'prints menu items' do
    #expect(subject).to respond_to(:print_menu)
    expect(subject.print_menu).to eq (menu_items)
  end

end
end
