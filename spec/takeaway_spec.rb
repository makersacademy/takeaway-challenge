require 'takeaway'

RSpec.describe Takeaway do
  let(:printed_menu) { 'wonton £10, congee £10' }
  let(:menu) { double :menu, :print_menu => printed_menu, :dishes => dishes_on_menu }
  let(:takeaway) { described_class.new(menu) }
  let(:order) { double :order, add }
	let (:send_sms) { double(:send_sms) }

  let(:dishes_on_menu) do {
    spring_rolls: 5,
    wonton: 10,
    congee: 10,
    chow_mein: 15,
    hotpot: 20
    }
  end

  describe '#view_menu' do
    it 'shows the menu' do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end

  describe '#choose' do
    it 'allows user to select dishes' do
      expect(takeaway.choose(dishes_on_menu)).to eq(dishes_on_menu)
    end 
  end

  describe '#place_order' do
    before(:each) do
      allow(takeaway).to receive(:send_sms).and_return(true)
    end
    
    it 'sends an SMS' do
      expect(takeaway.send_sms).to eq true
    end
  end
end
