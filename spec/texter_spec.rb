require 'texter'
require 'envyable'
Envyable.load('config/env.yml')

describe Texter do

  subject(:texter) { described_class.new }

  it 'sends a text' do
    number = ENV['MY_NUMBER']
    body = "This is a text"
    texter.send(number, body)
    expect(texter.messages[0].body).to include body
  end

end
