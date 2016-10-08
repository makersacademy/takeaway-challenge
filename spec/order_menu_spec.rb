require 'order_menu'
describe OrderMenu do

  subject(:order) {described_class.new}

  describe " displays the options menu" do
    specify { expect { order.option_menu }.to output.to_stdout }
  end

  #you can create a new order

  # you can view you current order

  # you can confirm order



end
