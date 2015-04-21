require 'capybara/rspec'
require 'menu'
require 'text_confirm'
RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

feature 'As a customer' do

  let(:menu) { Menu.new }
  let(:text_confirm) { TextConfirm.new }
  let(:dishes) do
    {
      cheeseburger: 3.00,
      hamburger: 2.00,
      chips: 1.50,
      coke: 1.00,
      water: 0.80
    }
  end
  let(:some_dishes) { { cheeseburger: 2, chips: 1, coke: 1 } }
  let(:time) { (Time.new + 3600) }
  let(:formated_order) { (some_dishes.merge(total: 8.50)).to_s + " expect delivery at #{time.strftime("%H:%M")}" } # rubocop: disable all
  let(:fake_client) { double(:fake_client) }

  scenario 'I would like to see a list of dishes with prices' do
    expect(menu.show_menu).to eq dishes
  end

  scenario 'I would like to be able to select some number of several
    available dishes' do
    menu.select_dishes some_dishes
    expect(menu.selection).to eq some_dishes
  end

  scenario 'I would like to check that the total I have been given matches the
    sum of the various dishes in my order' do
    menu.select_dishes some_dishes
    expect(menu.price).to eq 8.50
  end

  before(:example) do
    # stubs the method chain but returns the argument
    fake_client.stub_chain("account.messages.create") { |arg| arg[:body] }
    # 'instatiates' a fake client
    Twilio::REST::Client.stub(:new).and_return(fake_client)
  end

  scenario 'I would like to receive a text such as "Thank you! Your order
    was placed and will be delivered before 18:52" after I have ordered' do
    menu.select_dishes some_dishes
    my_order = menu.order
    text_confirm.format_order my_order
    expect(text_confirm.send_order).to eq formated_order
  end

end