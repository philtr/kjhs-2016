
class Developer < Person
  def subjects_to_study
    [
      "Computer Science", # Duh
      "Math",
      "Art",
      "English", # yes, English!
    ]
  end
end

Developer.new.subjects_to_study.to_sentence







