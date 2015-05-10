require 'menu'
require 'customer'
require 'restaurant'

feature 'A customer can place an order' do

  let(:menu) { Menu.new }
  let(:restaurant) { Restaurant.new(menu) }
  let(:customer) { Customer.new }

  scenario 'A customer can view the menu' do
    expect(customer.view_menu(restaurant)).to eq restaurant.menu
  end

  scenario 'A customer can choose items to order' do
    customer.view_menu(restaurant)
    expect(customer.choose_dishes("Lobster", "Ice Cream")).to eq ["Lobster", "Ice Cream"]
    expect(customer.choose_dishes("Ice Cream")).to eq ["Ice Cream"]
  end

  scenario 'A customer can choose any number of each dish' do
    customer.view_menu(restaurant)
    customer.choose_dishes("Lobster")
    expect(customer.choose_amount(2)).to eq ["Lobster", "Lobster"]
    expect(customer.choose_amount(1)).to eq ["Lobster"]
  end

  scenario 'A customer can review order' do
    customer.view_menu(restaurant)
    customer.choose_dishes("Ice Cream", "Lobster")
    customer.choose_amount(2, 2)
    expect(customer.view_order).to eq([["Ice Cream", 100.00], ["Ice Cream", 100.00], ["Lobster", 30.00], ["Lobster", 30.00], ["Grand Total", 260.00]])
  end

  scenario 'A customer cannot order off the menu' do
  end
end