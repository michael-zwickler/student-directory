@students = []

def interactive_menu
  loop do
    print_menu
    selection_process(gets.chomp.to_i)
  end
end

def selection_process(selection)
  case selection
  when 1
    students = input_students
  when 2
    if @students.length > 0
      show_students
    else
      puts 'No students entered yet'
    end
  when 9
    break
  else
    puts 'I did not get you. Please select again.'
  end
end

def input_students
    puts 'Please enter student information: '
    print 'Name: '
    name = gets.chomp
    name = 'default' if name.empty?
    
    print 'Cohort: '
    cohort = gets.chomp.to_sym
    while !existing_cohorts().include?(cohort)
      existing_cohorts = existing_cohorts().map {|sym| sym.to_s}
      print "Invalid cohort: use #{existing_cohorts} "
      cohort = gets.chomp.to_sym
    end
          
    print 'Height: '
    height = gets.chomp
    height = 'default' if height.empty?
    
    print 'Country of birth: '
    cob = gets.chomp
    cob = 'default' if cob.empty?

    id = 1001 + @students.length

    @students.push( {id: id, name: name, cohort: cohort, height: height, cob: cob} )
    puts "Succesfully added. # of students: #{@students.length}"
end

def existing_cohorts()
  cohorts = [:november, :dezember, :january]
end

def print_menu
  puts 'What do you want to do'
  puts '-- 1 -- Input student'
  puts '-- 2 -- Print list of students'
  puts '-- 9 -- Exit'
end

def print_header
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def show_students
  print_header
  print_students
  print_footer
end

def print_students
  existing_cohorts().each do |cohort|
    puts cohort
    @students.each do |student|
      if student[:cohort] == cohort
        puts student
      end
    end
  end
 
end  

def print_footer
  plural_s = 's' if @students.length > 1
  puts "Overall, we have #{@students.count} great student#{plural_s}!"
end

interactive_menu