require 'Takeaway'

describe Takeaway do

  it 'can add a dish to the menu' do
    subject.add_dish("Chicken jalfrezi", 7.99)
    expect(subject.menu.size).to eq 1
  end

  it 'can display menu' do
    name = "Chicken jalfrezi"
    price = 7.99
    subject.add_dish(name, price)
    expect { subject.display_menu }.to output("#{name}: £#{price}\n").to_stdout
  end

  it 'can be populated with a set menu' do
    subject.populate_menu
    expect(subject.menu.size).to eq 7
  end

  it 'can correctly format currency values' do
    expect(currency(8)).to eq "£8.00"
  end

  context 'when ordering' do

    it 'can allow an order to be placed' do
      takeaway = Takeaway.new
      takeaway.populate_menu
      delivery_time = Time.now + 60 * 60
      time = delivery_time.strftime("%k:%M")
      m = "Thank you! Your order was placed and will be delivered before #{time}"
      expect(takeaway.order("1 Chicken jalfrezi, £8.00")).to eq m
    end

  end

end
