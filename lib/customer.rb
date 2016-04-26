class Customer

  attr_reader :name, :phone

  def initialize(name:, phone:)
    @name = name
    @phone = phone
  end
end