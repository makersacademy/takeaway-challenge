require 'dishes'

describe Dishes do

  context '#select_item' do

    it 'selects correct hash depending on condidition' do
      expect(subject.select_item('001')). to eq [{ id: "001", item: "Pepperoni Pizza", price: "7.99" }]
    end
  end

  context '#format_items' do

    it 'displays menu in formatted way' do
      ordered = [
        "ID#{Dishes::DISHES[0][:id]} - £#{Dishes::DISHES[0][:price]} : #{Dishes::DISHES[0][:item]}",
        "ID#{Dishes::DISHES[1][:id]} - £#{Dishes::DISHES[1][:price]} : #{Dishes::DISHES[1][:item]}",
        "ID#{Dishes::DISHES[2][:id]} - £#{Dishes::DISHES[2][:price]} : #{Dishes::DISHES[2][:item]}",
        "ID#{Dishes::DISHES[3][:id]} - £#{Dishes::DISHES[3][:price]} : #{Dishes::DISHES[3][:item]}",
        "ID#{Dishes::DISHES[4][:id]} - £#{Dishes::DISHES[4][:price]} : #{Dishes::DISHES[4][:item]}",
        "ID#{Dishes::DISHES[5][:id]} - £#{Dishes::DISHES[5][:price]} : #{Dishes::DISHES[5][:item]}"
      ]
      expect(subject.format_items).to eq ordered
    end
  end
end
