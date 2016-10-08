require 'order'

describe Order do

  subject(:order) {described_class.new}

  it " creates an instance of the class" do
    expect(order).to be_instance_of(Order)
  end

  describe '#initialize' do
    it "with an instance of the menu class" do
      expect(order.menu).to be_instance_of(Menu)
    end
  end


end
