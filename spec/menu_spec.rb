require 'menu'

describe Menu do
  price_list = {"Hamburger" => "£2.00", "Hot-dog" => "£3.00", "Fries" => "£5.00"}
  subject(:menu) { described_class.new(price_list) }

  it 'should initialize with a list of dishes and prices' do
    expect(menu.price_list).to eq price_list
  end

  describe '#display' do
    it 'should respond to the display method' do
      expect(menu).to respond_to(:display)
    end

    it 'should display the list of dishes and prices' do
      expect(menu.display).to eq price_list.each{|k, v| puts "#{k} : #{v}"}
    end
  end

end
