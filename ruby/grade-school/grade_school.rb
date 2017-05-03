class School
  def initialize
    @grades = Hash.new { |students, grade| students[grade] = [] }
  end

  def students(grade)
    @grades[grade].sort
  end

  def add(name, grade)
    @grades[grade] << name
  end

  def students_by_grade
    @grades.keys.sort.map do |grade|
      { grade: grade, students: students(grade) }
    end
  end
end

module BookKeeping
  VERSION = 3
end
