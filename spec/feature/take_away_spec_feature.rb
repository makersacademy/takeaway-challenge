require 'capybara/rspec'
require 'menu'
require 'text_conf'
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
      bigmac: 3.99,
      quater_pounder: 3.99,
      chicken_mcnuggets: 2.50,
      fries: 0.99,
      cheese_burger: 0.99,
      ham_burger: 0.99,
      milk_shake: 0.99
    }
  end
  let(:some_dishes) { { bigmac: 3, fries: 3, cheese_burger: 5, milk_shake: 2 } }
  let(:time) { (Time.new + 3600) }
  let(:formated_order) do
    (some_dishes.merge(total: 21.87)).to_s +
      " expect delivery at #{time.strftime('%H:%M')}"
  end
  let(:fake_client) { double :fake_client }

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
    expect(menu.price).to eq 21.87
  end

  before(:example) do
    fake_client.stub_chain("account.messages.create") { |arg| arg[:body] }
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