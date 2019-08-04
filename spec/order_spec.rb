# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
# context 'select items' do

  describe Order do
    let(:order){ described_class.new({ 'A' => 1550, "B" => 1050 })}


    it 'adds items and number to array' do
      allow(takeout).to receieve(:order).and_return
      order.select("A", 2)
      order.select("B", 1)
      expect(subject.order).to eq({ "A" => 2, "B" => 1 })
    end
  end
end
