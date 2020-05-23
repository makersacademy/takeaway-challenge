require 'order'

describe Order do
  let(:user_inputs) { 
    @dish = "dish name"
    @quantity = "3"
  }
  let(:dish_prompt) { "Please enter the dish name:\n" + "[to finish, hit Return twice]\n" }
  let(:quantity_prompt) { "Please enter the quantity:\n" }
  let(:confirmation_prompt) { "-- #{@quantity} #{@dish}(s) added! --\n" }
  let(:error_prompt) { "Invalid entry, please try again:" }
  let(:complete_order) { 
    dish_prompt + quantity_prompt + confirmation_prompt + dish_prompt 
  }
  let(:invalid_quantity_order) { 
    dish_prompt + quantity_prompt + error_prompt + confirmation_prompt + dish_prompt
  }

  describe '#request_order' do
    it 'prompts the user to make an order' do
      user_inputs
      allow(subject).to receive(:gets).and_return(@dish, @quantity, "")
      expect { subject.request_order }.to output(complete_order).to_stdout
    end

    it 'alerts the  user if quantity entered is invalid and asks to re-enter' do
      user_inputs
      allow(subject).to receive(:gets).and_return(@dish, "invalid", @quantity, "")

    end
  end
end
