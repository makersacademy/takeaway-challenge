require 'dotenv'

class Messager

  attr_reader :person

  def initialize(person)
    Dotenv.load
    @person = person
  end
end
