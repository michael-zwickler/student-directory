def print_header
  puts
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def input_students
  students = []
  puts
  
  print 'Type quit if you are finished with adding students, else hit enter '
  while gets.chomp != 'quit'
    puts 'Please enter student information: '
    
    print 'name: '
    name = gets.chomp
    name = 'default' if name.empty?
    
    print 'cohort: '
    cohort = gets.chomp.to_sym
    while !existing_cohorts().include?(cohort)
      existing_cohorts = existing_cohorts().map {|sym| sym.to_s}
      print "invalid cohort: use #{existing_cohorts} "
      cohort = gets.chomp.to_sym
    end
          
    print 'height: '
    height = gets.chomp
    height = 'default' if height.empty?
    
    print 'country of birth: '
    cob = gets.chomp
    cob = 'default' if cob.empty?

    id = 1001 + students.length

    students.push( {id: id, name: name, cohort: cohort, height: height, cob: cob} )
    puts "Succesfully added. # of students: #{students.length}"
    puts
    print 'Type quit if you are finished with adding students, else hit enter '
  end
  return students
end

def existing_cohorts()
  cohorts = [:november, :dezember, :january]
end

def print_students(students)

  existing_cohorts().each do |cohort|
    puts cohort
    students.each do |student|
      if student[:cohort] == cohort
        puts student
      end
    end
  end
 
end  

def print_footer(students)
  puts
  plural_s = 's' if students.length > 1
  puts "Overall, we have #{students.count} great student#{plural_s}!"
  puts
end

# Method calls
students = input_students()
print_header()
print_students(students) if students.length > 0
print_footer(students)