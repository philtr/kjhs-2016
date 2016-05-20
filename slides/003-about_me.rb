
# Here's some  Ruby:
class Person
  attr_accessor :name,
                :birthday
end

class Developer < Person
  attr_accessor :employer,
                :job_title
end

# But who am I?
pr           = Developer.new
pr.name      = "Phillip Ridlen"
pr.birthday  = (30.years + 7.months + 29.days).ago
pr.employer  = "Oven Bits <http://ovenbits.com>"
pr.job_title = :web_developer


