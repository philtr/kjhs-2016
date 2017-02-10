
module GreatEmployee
  def manager_of
    [self]
  end

  def excellent_communicator?(audience = :clients)
    {
      clients: true,
      teammates: true
    }[audience]
  end

  def ego
    nil #teamplayership
  end
end

Developer.include(GreatEmployee)


