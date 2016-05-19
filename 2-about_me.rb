
class Person
  attr_accessor :name,
                :birthday,
                :age,
                :employer,
                :job_title
end

# But who am I?
p           = Person.new
p.name      = "Phillip Ridlen"
p.birthday  = (30.years + 7.months + 20.days).ago
p.employer  = "Oven Bits <http://ovenbits.com>"
p.job_title = :developer




