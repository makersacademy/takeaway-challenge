require 'menu'

describe Menu do

  it { is_expected.to respond_to(:menu_list) }

  describe '#update_menu_list' do
    it 'is expected to update the menu list' do
      subject.update_menu_list('biryani', 10)
      expect(subject.menu_list).to include({dish: 'biryani', price: 10, available?: true})
    end

    it 'should default the menu availibility to true' do
      subject.update_menu_list('biryani', 10)
      expect(subject.menu_list[0][:available?]).to eq true
    end
  end

  it 'menu list should have a dish and a price' do
    subject.update_menu_list('biryani', 10)
    expect(subject.menu_list[0][:dish]).to eq('biryani')
  end

  describe'#update_availibility' do
    it 'updates the availibility of a dish' do
      subject.update_menu_list('biryani', 10)
      subject.update_availibility('biryani', false)
      expect(subject.menu_list[0][:available?]).to eq false
    end
  end
end