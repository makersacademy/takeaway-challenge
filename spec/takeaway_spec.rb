require 'takeaway'

describe TakeAway do
  let(:order_ex) {double :order}
  before(:each) {allow(order_ex).to receive(:new).with("my_order")}

  subject(:takeaway) {described_class.new(order_ex)}



  context "when selecting the dishes" do

    it "read the options" do
      expect(takeaway.read_menu).to eq( {:burger=>10, :salad=>5, :drink=>2})
    end


    it "order 1 portion of burger from the takeaway and save it in my order array" do

      expect(takeaway.add(:burger, 1)).to eq({:burger=>{:portions=>1, :price=>10}})
    end

    it "order 2 portions of burger and save it in my order array" do

      expect(takeaway.add(:burger, 2)).to eq({:burger=>{:portions=>2, :price=>10}})
    end


  end



end
