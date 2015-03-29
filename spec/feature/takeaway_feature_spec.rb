require 'capybara/rspec'
require 'takeaway'

feature 'Takeaway feature test' do
  let(:takeaway) { Takeaway.new }

  before do
    takeaway.customer('Bob', '07951761165')
  end

  scenario 'Takeaway knows customer is Bob' do
    expect(takeaway.customer_name).to eq 'Bob'
  end
end
