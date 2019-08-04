# As a customer
# So that I can check if I want to order something
# I would like to see a menu of dishes with prices
require 'takeout'

  describe Takeout do

  context 'menu' do
    let(:takeout){ described_class.new({ 'A' => 1550, "B" => 1050 })}
    it 'contains menu hash accessible by menu method' do
      expect(takeout.menu).to eq({ 'A' => 1550, "B" => 1050 })
    end
  end

  context 'add to menu' do
    let(:takeout){ described_class.new({ 'A' => 1550, "B" => 1050 }) }
    it 'adds items and number to array' do
      takeout.add_to_menu({ "C" => 5 })
      expect(takeout.menu).to eq({ 'A' => 1550, "B" => 1050, "C" => 5 })
      end
    end

    context 'prices order' do
      let(:takeout){ described_class.new({ 'A' => 1550, "B" => 1050 }) }
      it 'totals order' do
        allow(takeout).to receive(:order).and_return({'A' => 1, 'B' => 1})
        expect(takeout.price).to eq(2600)
        end
      end

    context 'confirm order method is functional' do
    let(:takeout){ described_class.new({ 'A' => 1550, 'B' => 1050 }) }
    it 'takes method confirm order' do
      expect(takeout).to respond_to(:confirm_order)
      end
    end
  end
