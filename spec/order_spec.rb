require 'order'

describe Order do
  let(:double_data) { { "spring roll" => "0.99", "pork dumpling" => "2.99" } }
  let(:user_inputs) { @dish = "Spring roll"; @quantity = "3" }
  let(:dish_prompt) { "Please enter the dish name:\n" + "[to finish, hit Return]\n" }
  let(:quantity_prompt) { "Please enter the quantity:\n" }
  let(:confirmation_prompt) { "-- #{@quantity} #{@dish}(s) added! --\n\n" }
  let(:error_prompt) { "Invalid entry, please try again:\n" }
  let(:complete_order) do 
    dish_prompt + quantity_prompt + confirmation_prompt + dish_prompt 
  end
  let(:invalid_quantity_order) do 
    dish_prompt + quantity_prompt + error_prompt + confirmation_prompt + dish_prompt
  end
  let(:invalid_dish_order) do 
    dish_prompt + error_prompt + quantity_prompt + confirmation_prompt + dish_prompt
  end

  before(:each) do 
    allow(subject).to receive(:load_data) { double_data } 
    user_inputs
  end

  describe '#request_order' do

    it { is_expected.to respond_to(:request_order) }

    it 'prompts the user to make an order' do
      allow(subject).to receive(:gets).and_return(@dish, @quantity, "")
      expect { subject.request_order }.to output(complete_order).to_stdout
    end

    it 'allows user to exit by hitting return key' do
      allow(subject).to receive(:gets).and_return("")
      expect { subject.request_order }.to output(dish_prompt).to_stdout
    end

    it 'alerts the user if quantity entered is invalid and asks to re-enter' do
      allow(subject).to receive(:gets).and_return(@dish, "INVALID QUANTITY 123", @quantity, "")
      expect { subject.request_order }.to output(invalid_quantity_order).to_stdout
    end

    it 'alerts the user if dish entered is not on the menu and asks to re-enter' do
      allow(subject).to receive(:gets).and_return("INVALID DISH", @dish, @quantity, "")
      expect { subject.request_order }.to output(invalid_dish_order).to_stdout
    end

    it 'returns a hash of the user\'s order' do
      allow($stdout).to receive(:puts) # console output suppressed
      allow(subject).to receive(:gets).and_return("spring roll", "2", "pork dumpling", "4", "spring roll", "3", "")
      expect(subject.request_order).to eq({ "spring roll" => 5, "pork dumpling" => 4 })
    end

    it 'converts user entries to downcase' do # this is important as user entries will be used as a lookup for dish prices
      allow($stdout).to receive(:puts) # console output suppressed
      allow(subject).to receive(:gets).and_return("Spring Roll", "2", "pOrk dumPling", "4", "")
      expect(subject.request_order).to eq({ "spring roll" => 2, "pork dumpling" => 4 })

    end
  end
end
