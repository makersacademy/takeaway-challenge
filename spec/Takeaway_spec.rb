require 'Takeaway'

describe Takeaway do

  dish_1_name = "Chicken jalfrezi"
  dish_1_price = 7.99

  context 'in general' do

    it 'can add a dish to the menu' do
      subject.add_dish(dish_1_name, dish_1_price)
      expect(subject.menu.size).to eq 1
    end

    it 'can display menu' do
      food = dish_1_name
      price = dish_1_price
      expected_output = "#{food}: £#{price}\n"
      subject.add_dish(food, price)
      expect { subject.display_menu }.to output(expected_output).to_stdout
    end

    it 'can be populated with a set menu' do
      subject.populate_menu
      expect(subject.menu.size).to eq 7
    end

    it 'can correctly format currency values' do
      expect(number_to_currency(8)).to eq "£8.00"
    end

  end

  context 'when ordering' do

    it 'can display the order' do
      food = dish_1_name
      price = dish_1_price
      expected_output = "1x #{food} = £#{price}\n"
      subject.add_dish(food, price)
      subject.add_to_order(food)
      expect { subject.view_order }.to output(expected_output).to_stdout
    end

    it 'can correctly display more than one of the same dish' do
      food = dish_1_name
      price = dish_1_price
      expected_output = "2x #{food} = £#{2 * price}\n"
      subject.add_dish(food, price)
      subject.add_to_order(food)
      subject.add_to_order(food)
      expect { subject.view_order }.to output(expected_output).to_stdout
    end

    it 'can display the order total' do
      food = dish_1_name
      price = dish_1_price
      expected_output = "£#{price}\n"
      subject.add_dish(food, price)
      subject.add_to_order(food)
      expect { subject.view_total }.to output(expected_output).to_stdout
    end

    it 'can add more than one of the same dish at a time' do
      food = dish_1_name
      price = dish_1_price
      expected_output = "2x #{food} = £#{2 * price}\n"

      subject.add_dish(food, price)
      subject.add_to_order("2 #{food}")

      expect { subject.view_order }.to output(expected_output).to_stdout
    end

    pending 'can remove a dish from the order'

    it 'allows order to be placed if provided total is correct' do
      food = dish_1_name
      price = dish_1_price
      time = Time.now + 60 * 60
      expected_output = SUCCESSFUL_ORDER_MESSAGE + time.strftime("%k:%M") + "\n"
      subject.add_dish(food, price)
      subject.add_to_order(food)
      expect { subject.place_order(dish_1_price, Screen) }.to output(expected_output).to_stdout
    end

    it 'raises an error if placing an order with an incorrect total' do
      food = dish_1_name
      price = dish_1_price
      expected_output = TOTAL_MISMATCH_ERROR
      subject.add_dish(food, price)
      subject.add_to_order(food)
      expect { subject.place_order(6.99) }.to raise_error(expected_output)
    end

    pending 'can receive an order via SMS'

  end

end
