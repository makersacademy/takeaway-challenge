require 'takeaway'

describe Takeaway do
  let(:dishes) {double}

  describe '#basket' do
    it "should have an empty basket" do 
     expect(subject.basket).to eq Hash.new
    end
  end

   describe "#read_menu" do
   let(:dishes){double}
  it "displays the menu" do
    expect(subject.read_menu).to eq dishes
    #({hamburger: 3.99, tacos: 4.99, spaghetti: 5.99, fries: 4.59}) 
  end
end

  describe "#order" do 
    # it "adds food and amount to basket" do
    #   expect(subject.order.with(2).arguments 
      it { is_expected.to respond_to(:order).with(2).arguments }
    # end
  end

  describe "#basket_summary" do
  it "shows what's currently in the basket" do
  expect(subject.basket_summary).to eq subject.basket
  end
end

end 

