class Customer

  attr_reader :name, :phone

  def initialize(name:, phone:)
    @name, @phone = name, phone
  end
end