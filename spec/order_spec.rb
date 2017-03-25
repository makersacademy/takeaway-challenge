require 'order'

describe Order do

  subject(:order) { described_class.new }
  # let(:gets.chomp) { 1 }
  # let(:input) { 1 }

  describe '#add' do

    context 'input is valid' do

      before do
        $stdin = StringIO.new("1")
      end

      after do
        $stdin = STDIN
      end

      it 'retrieves user input and selects the corresponding dish' do
        expect(order.add).to eq [{:dish=>"Chop Sooy, With White Mushrooms", :price => 2 }]
      end

      it "to the order list" do
        order.add
        expect(order.selection).to include({:dish=>"Chop Sooy, With White Mushrooms", :price => 2 })
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
        expect{order.add}.to raise_error "Invalid selection: please select a number between 1 and 22"
      end

    end


  end

end
