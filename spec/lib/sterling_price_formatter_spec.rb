require 'sterling_price_formatter'

describe SterlingPriceFormatter do
  subject(:pricer){described_class.new(json,quantity)}
  let(:json) {[{"stuff"=>3,"name"=>"Whole Wheat Blueberry Muffin",
    "portion"=>"1"},{"name"=>"Assorted Bagels", "portion"=>"1"}]}
  let(:quantity){ 1 }

  let(:output){["Whole Wheat Blueberry Muffin", "£1.20", "Assorted Bagels", "£1.20"]}

  describe '#convert' do
    it 'formats price data to sterling' do
      expect(pricer.convert).to eq output
    end
  end
end