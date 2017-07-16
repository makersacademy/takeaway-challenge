require 'takeaway'

describe Takeaway do
  subject(:thai) { described_class.new }
  let(:dishes) { { "Green Curry" => 2, "Rice" => 2 } }
  let(:dish1) { "Green Curry" }
  let(:quantity) { 2 }
  let(:dish2) { "Rice" }
  let(:dish3) { "Not on menu" }
  let(:total) { 4 }

  it 'stores the open orders' do
    thai.order(dish1, quantity, 2)
    thai.order(dish2, quantity, 2)
    expect(thai.open_orders).to eq [{ dish1 => quantity }, { dish2 => quantity }]
  end

  describe '#view_menu' do
    it 'shows the list of dishes with prices' do
      expect { thai.view_menu }.to output("Green Curry: £6\nMassaman Curry: £6\nPanang Curry: £6\nPad Thai: £7\nRice: £2\nPad Pak: £3\nSingha: £4\n").to_stdout
    end
  end

  describe '#order' do
    it 'creates the order' do
      expect(thai.order(dish1, quantity, dish2, quantity, total)).to eq [dishes]
    end

    it 'raises an error if order includes a dish not on the menu' do
      expect { thai.order(dish3, quantity, 2) }.to raise_error "Sorry, we do not serve #{[dish3, quantity, 2]}"
    end

  end

  # describe '#confirm_order' do
  #   it 'sends an sms to the customer to confirm delivery will be made within the hour' do
  #     thai.order(dish1, quantity, dish2, quantity, total)
  #     expect { thai.confirm_order }.to output("Sent message to customer\n").to_stdout
  #   end
  # end

end
