require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:menuclass) { double(:menuclass, new: menu) }
  subject { Takeaway.new(menuclass) }

  describe '#show_menu' do
    it 'displays the menu' do
      expect(menu).to receive(:display)
      subject.show_menu
    end
  end

  describe '#order' do
    it 'orders items from the menu and tells user it is in basket' do
      katsucurry = double(:katsucurry, include?: true)
      allow(katsucurry).to receive(:downcase).and_return(katsucurry)
      allow(katsucurry).to receive(:[]).and_return(1.00)
      allow(menu).to receive(:items).and_return(katsucurry)
      expect(subject.order(katsucurry)).to eq("1 x #{katsucurry} has been added to your basket")
    end

    it "tells user item ordered is not in menu if it menu doesn't have it" do
      something = double
      allow(something).to receive(:downcase)
      allow(menu).to receive(:items).and_return({})
      message = "Sorry! We don't have what you've just ordered. Check the menu for what's on offer!"
      expect(subject.order(something)).to eq(message)
    end
  end

end
