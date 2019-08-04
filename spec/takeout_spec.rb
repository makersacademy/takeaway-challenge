# As a customer
# So that I can check if I want to order something
# I would like to see a menu of dishes with prices
require 'takeout'

  describe Takeout do

  context 'menu' do
    let(:takeout){ described_class.new({ 'A' => 1550, "B" => 1050 })}
    it 'Shows list of dishes with prices' do
      expect(takeout.menu).to eq({ 'A' => 1550, "B" => 1050 })
    end
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been
# given matches the sum of the various dishes in my order


  context 'add to menu' do
    let(:takeout){ described_class.new({ 'A' => 1550, "B" => 1050 })}
    it 'adds items and number to array' do
      takeout.add_items({"C"=> 5})
      expect(takeout.menu).to eq({ 'A' => 1550, "B" => 1050, "C"=> 5 })
    end
  end
end
