
class Developer < Person
  def required_education
    case job_title # depends on what you want to do

    when :data_analyst
      "Degree in Math/Statistics"

    when :video_game_programmer
      "Degree in Computer Science or Math"

    when :web_developer, :app_developer
      "Degree in " +
        "Computer Science, " +
        "Business, or "  +
        "Graphic Design"
    end
  end
end

