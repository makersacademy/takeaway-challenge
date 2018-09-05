class Foo
  def self.bar(baz)
    # not important what happens to baz parameter
    # only important that it is passed in
    new
  end

  def qux
    # perform some action
  end
end

class SomethingThatCallsFoo
  def some_long_process(baz)
    # do some processing
    Foo.bar(baz).qux
    # do other processing
  end
end
