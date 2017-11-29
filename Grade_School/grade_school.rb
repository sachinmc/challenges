# roster that stores students name and grade

# add a students name to the roster for a grade
# list of all students enrolled in a grade

# sorted list, grades to be sorted as 1,2,3 etc
# students within a grade to be sorted alphabetically
require 'pry'

class School
  def initialize
    @roster = Hash.new([])
  end

  def add(name, grade)
    @roster[grade] += [name]
  end

  def grade(num)
    @roster[num]
  end

  def to_h
    @roster.transform_values!(&:sort)
    @roster.sort.to_h 
  end
end

# school = School.new

# school.add('Paul', 2)
# school.add('Blair', 2)
# school.add('James', 1)
# p school.to_h
