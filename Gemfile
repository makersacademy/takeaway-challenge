source 'https://rubygems.org'

ruby '2.4.0'

gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'simplecov', require: false, group: :test
gem 'simplecov-console', require: false, group: :test
gem 'twilio-ruby'

# put your own credentials here
account_sid = 'AC30dc5b990ed47dc40d92963328691a89'
auth_token = '3836dc07ae8ad1dcb7013deffa80468cn'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+44 1677 252017',
  :to => '+447730474548',
  :body => 'Thank you! Your order was placed and will be delivered before 18:52.',
  :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
})
