require 'order'

describe Order do

  it 'displays a list of available dishes' do
    expect(subject.print_menu).to eq("Miso Soup £3.5")
  end
  
end
