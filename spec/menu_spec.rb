require 'menu'

describe Menu do
    
    let(:dishes_file)   { "./lib/dishes.txt" }
    let(:dishes)        { create_dishes_hash(dishes_file) }
    
    subject(:menu)      { described_class.new(dishes_file) }
    
    it 'reads dishes_file to create a dishes hash' do
        expect(menu.dishes).to eq(dishes)
    end
    
    it 'can print a list of dishes' do
        expect(menu.print_dishes).to eq(print_dishes(dishes))
    end
end

def create_dishes_hash(dishes_file)
    dishes = {}
    
    File.readlines(dishes_file).each do |line|
        line.scan(/^(\S*)\s(\d*)$/) do |meal, price|
            dishes[meal.to_sym] = price.to_i
        end
    end
    dishes
end

def print_dishes(dishes)
    dish_list = ""
    dishes.each do |meal, price|
        meal = meal.to_s.gsub(/[_]/, ' ').split.map { |w| w.capitalize }.join(' ')
        price = price.to_s.gsub(/\d{2}\z/) { |m| '.' + m }
        dish_list << "#{meal} £#{price}, "
    end
    dish_list.gsub(/\W\s\z/, '.')
end
    