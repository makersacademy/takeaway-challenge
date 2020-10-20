require './lib/takeaway.rb'

feature 'adding takeaway to database' do
  scenario 'adding carbonara to the database' do
    takeaway = Takeaway.new
    expect{ takeaway.confirm_order }.to_not raise_error
  end
end