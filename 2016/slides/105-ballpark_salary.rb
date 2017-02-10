
class Developer < Person
  # Depends on your experience
  attr_accessor :years_experience
  # Depends on where you live
  attr_accessor :cost_of_living_adj

  def base_salary
    50_000 + cost_of_living_adj
  end

  def ballpark_salary
    salary = if years_experience < 10
      base_salary + (years_experience * 10_000)
    else
      base_salary + 100_000
    end
    (salary-15_000)..(salary+15_000)
  end
end

