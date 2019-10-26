require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu}
  subject(:subject) { described_class.new(menu: menu) }
  let(:item1) { "pizza" }
  let(:quantity1) { 3 }

  before(:each) do
    allow(menu).to receive(:view_list).and_return( { "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 } )
  end

  describe "#view_menu" do
    it 'shows the menu' do
      expect(subject.view_menu).to eq( { "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 } )
    end
  end

  describe "#order" do
    it "records and returns the user's input" do
      expect(subject.order).to eq({ item1 => quantity1 })
    end
  end

  describe "#view_summary" do
    it "has an empty basket before the order" do
      expect(subject.view_summary).to be_empty
    end

  end
end
