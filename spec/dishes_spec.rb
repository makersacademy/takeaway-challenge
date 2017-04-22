require 'dishes'

describe Dishes do

  describe '#print_list' do
    it 'should print list of dishes and prices' do
      expect(subject.print_list).to eq subject.pizzas.each { |dish, price| puts "#{dish}, #{price}" }
    end
  end

  describe '#print_header' do
    it 'should print header' do
      expect(subject.print_header).to eq puts "Pizza Menu"
    end
  end

end
