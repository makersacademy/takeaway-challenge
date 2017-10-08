require 'takeaway'

describe 'feature tests' do

  let(:takeaway) { Takeaway.new }

  dish, price = 'wonton soup', 3.00

  it 'prints a list of dishes with prices' do
    expect { takeaway.print_menu }.to output.to_stdout
  end

  context 'given the dish is available' do

    it 'allows the user to order a quantity of available dishes' do
      expect(takeaway).to receive(:add_items).with(dish, price)
      takeaway.order(dish, price)
    end

  end
  context 'given the dish is not on the menu' do

    it "raises an error if the dish isn't on the menu" do
      error = 'dish is not on the menu'
      expect { takeaway.order 'fish sauce' }.to raise_error error
    end

  end

  it 'prints the order total' do
    takeaway.order dish
    expect(takeaway.order_total).to eq "Total = £3.0"
  end

  it 'sends an sms confirmation to the user' do
    allow(takeaway).to receive(:send_confirmation) { nil }
    takeaway.order dish
    expect(takeaway).to receive(:send_confirmation)
    takeaway.checkout(3)
  end

end
