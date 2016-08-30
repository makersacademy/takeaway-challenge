require 'food_list_formatter'


describe FoodListFormatter do
  subject(:formatter){described_class.new(data)}
  let(:data) { [{"stuff"=>3,"name"=>"Whole Wheat Blueberry Muffin",
    "portion"=>"1"},{"name"=>"Assorted Bagels", "portion"=>"1"}] }

  let(:sorted_data){{"Assorted Bagels"=>"£1.20",
    "Whole Wheat Blueberry Muffin"=>"£1.20"}}

  describe'#convert_sterling' do
    it 'formats data to a food/price hash' do
      expect(formatter.convert_sterling).to eq sorted_data
    end
    it 'formats currency to sterling' do
      expect(formatter.convert_sterling.values[0]).to match(/£\d+.\d+/)
    end
  end
end