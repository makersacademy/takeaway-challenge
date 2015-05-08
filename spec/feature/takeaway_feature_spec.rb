require 'capybara/rspec'
require 'takeaway'

feature 'Customer orders a takeaway' do
  let(:takeaway) { Takeaway.new }

  scenario 'Customer can view the menu' do
    expect { takeaway.view_menu }.to output.to_stdout
  end

  before(:example) do
    takeaway.add_item('A4', 5)
    takeaway.add_item('B3')
    takeaway.add_item('A1', 2)
  end

  scenario 'Customer can add some items to their order and see the total' do
    expect(takeaway.order_total).to eq 4760
  end

  scenario 'Customer receives a confirmation text' do
    mock_api = double :api
    expected_time = (Time.new + 3600).strftime("%I:%M%p")
    expected_message = "Thanks for your order. Your total is £47.60 "
    expected_message += "and your food should be with you by #{expected_time}"
    allow(takeaway).to receive(:message_sender).and_return mock_api
    expect(mock_api).to receive(:send_message).with(expected_message)
    takeaway.confirm_order
  end

end
