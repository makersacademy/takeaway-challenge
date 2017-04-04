class Customer

  attr_reader :name, :method, :identification

  def initialize(name:, method:, identification:)
    @name = name
    @method = method
    @identification = identification
  end

end
