require 'order'

describe Order do

  subject(:order) { described_class.new }
  # let(:gets.chomp) { 1 }
  # let(:input) { 1 }

  describe '#add' do
    let(:quantity) { 3 }
    let(:selection) {[
      {:dish=>"Chop Sooy, With White Mushrooms", :price => 2 },
      {:dish=>"Chop Sooy, With White Mushrooms", :price => 2 },
      {:dish=>"Chop Sooy, With White Mushrooms", :price => 2 }
    ]}

    context 'input is valid' do

      before do
        $stdin = StringIO.new("1")
      end

      after do
        $stdin = STDIN
      end

      it "adds a number of available dishes to the order list" do
        order.add(quantity)
        expect(order.selection).to eq selection
      end

    end

    context 'input is invalid' do

      before do
        $stdin = StringIO.new("23")
      end

      after do
        $stdin = STDIN
      end

      it "raises error if user input is not on the menu" do
        expect{order.add(quantity)}.to raise_error "Invalid selection: please select a number between 1 and 22"
      end

    end


  end

end
