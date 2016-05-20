
# Here's some  Ruby:
class Person
  attr_accessor :name,
                :birthday
end

class Developer < Person
  attr_accessor :employer,
                :job_title
end

# Who is this guy talking?
Phillip           = Developer.new
Phillip.name      = "Phillip Ridlen"
Phillip.birthday  = (30.years + 241.days).ago.to_date
Phillip.employer  = "Oven Bits <http://ovenbits.com>"
Phillip.job_title = :web_developer


