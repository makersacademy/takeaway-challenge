class Person

  attr_reader :name, :phone

  def initialize(name: name, phone: phone)
    @name = name
    @phone = phone
  end
end