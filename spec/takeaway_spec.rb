require 'takeaway'

describe TakeAway do
  let(:menu) { {"rice"=>1.50, "fries"=>2.50, "noodles"=>3.50, "pasta"=>6.50, "pizza"=>7.50} }

  describe "#view_menu" do
    it 'shows the menu' do
      expect(subject.view_menu).to eq menu
    end
  end

  context "user inputs the order" do
    describe "#order" do
      let(:item) { "pizza" }
      let(:quantity){ 3 }
      it "returns the user's input" do
        expect(subject.order).to eq({ item => quantity })
      end
    end
  end

end
