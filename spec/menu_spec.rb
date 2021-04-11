require 'menu'

describe Menu do

  it { is_expected.to respond_to(:menu_list) }

  it 'is expected to update the menu list' do
    subject.update_menu_list('biryani', 10)
    expect(subject.menu_list).to include({dish: 'biryani', price: 10})
  end

  it 'menu list should have a dish and a price' do
    subject.update_menu_list('biryani', 10)
    expect(subject.menu_list[0][:dish]).to eq('biryani')
  end
end