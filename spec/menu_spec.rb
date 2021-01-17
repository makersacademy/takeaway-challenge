require 'menu'

describe Menu do
  it ' displays the dishes on the menu' do
    printed_menu = "Chicken: £5, Potato: £2"
    # allow(subject).to receive(:display_menu).and_return(printed_menu)
    expect(subject.display_menu).to eq(printed_menu)
  end
end
