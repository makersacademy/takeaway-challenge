class FakeSMS
  Message = Struct.new(:from, :to, :body)
=begin

Structs are an alternative to creating explicit classes when you only want to use
attributes. Struct by default creaters getter and setter methods for the attributes.

=end
  attr_reader :message_list
=begin

cattr_accessor vs attr_accessor?

cattr basically stands for class attribute. This means that whatever you set as the cattr_accessor value,
will be the same for ALL instances of the class. Whatever attribute you change through attr_accessor,
however, will only be valid for that particular instance.

=end

  def initialize(_account_sid, _auth_token)
    @message_list = []
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    @message_list.push(body)
=begin

So self.foo acts on an instance. So if self is Status class, then self.foo acts on an instance of Status
(usually a method you call to modify that specific status, add information, look up information, etc.)

self.class is going to give you the Status class, and from there you can call arguments on the class. But
here, you aren't working with a specific instance. In other words, self.class.foo here is the same as Status.foo,
assuming self.class is Status.

=end
  end
end
