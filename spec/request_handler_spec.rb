require 'request_handler'

describe RequestHandler do
  subject { RequestHandler.new(params) }
  let(:params) { { 'Body' => 'help', 'From' => '447747516382' } }

  it 'is an instance of RequestHandler' do
    expect(subject).to be_an_instance_of RequestHandler
  end

  it 'has a body' do
    expect(subject).to respond_to :body
  end

  it 'has a from' do
    expect(subject).to respond_to :from
  end

  it 'has a response' do
    expect(subject).to respond_to :response
  end
end