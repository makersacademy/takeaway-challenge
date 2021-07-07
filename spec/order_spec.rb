require 'menu'
require 'site'

describe Site do

  let(:menu) { double(:menu, list: { "Falafal wrap" => 3, "Veggie Lasagna" => 5, "Pesto Pasta" => 6 })}

  describe '#print_menu' do
    it 'will show the menu' do
      dish = Site.new
      expect(dish.print_menu).to eq({ "Falafal wrap" => 3, "Veggie Lasagna" => 5, "Pesto Pasta" => 6 })
    end
  end

  describe '#select' do
    it 'will allow me to select the dish I want' do
      subject.select("Falafal wrap", 2)
      expect(menu.list).to include(subject.item)
    end

    it 'will allow me to select the quantity I want' do
      subject.select('Falafal wrap', 2)
      expect(subject.quantity).to eq(2)
    end
  end

  describe '#confirmation' do
    it 'will raise an error if the customer cannot confirm the amount' do
      subject.select("Falafal wrap", 2)
      subject.amount(10)
      expect{subject.confirm}.to raise_error("There was a problem placing your order, please try again.")
    end
  end
end
