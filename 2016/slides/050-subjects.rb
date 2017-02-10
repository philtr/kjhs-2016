
class Developer < Person
  def subjects_to_study
    [
      "English", # yes, English!
      "Computer Science", # Duh
      "Math",
      "Art",
    ]
  end
end

puts Developer.new.subjects_to_study.to_sentence







