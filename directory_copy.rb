@students = []

def interactive_menu
  loop do
    print_menu
    selection_process(STDIN.gets.chomp.to_i)
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
  when 3
    save_students
  when 4
    load_students
  when 9
    exit
  else
    puts 'I did not get you. Please select again.'
  end
end

def input_students
    puts 'Please enter student information: '
    print 'Name: '
    name = STDIN.gets.chomp
    name = 'default' if name.empty?
    
    print 'Cohort: '
    cohort = STDIN.gets.chomp.to_sym
    while !existing_cohorts().include?(cohort)
      existing_cohorts = existing_cohorts().map {|sym| sym.to_s}
      print "Invalid cohort: use #{existing_cohorts} "
      cohort = STDIN.gets.chomp.to_sym
    end
     
    @students.push( {name: name, cohort: cohort} )
    puts "Succesfully added. # of students: #{@students.length}"
end

def existing_cohorts()
  cohorts = [:November, :Dezember, :January]
end

def print_menu
  puts 'What do you want to do'
  puts '-- 1 -- Input student'
  puts '-- 2 -- Print list of students'
  puts '-- 3 -- Save students to students.csv'
  puts '-- 4 -- Load file from students.csv'
  puts '-- 9 -- Exit'
end

def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    data_array = []
    student.each_value do |value|
      data_array.push(value)   
    end
    file.puts(data_array.join(', '))
  end
  file.close
end

def try_load_students
  # ARGV is an array that stores the additional input when calling from terminal
  # ruby directory_copy.rb students.csv will run the .rb file and store students.csv in ARGV
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = 'students.csv')
  @students = []
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    array = line.chomp.split(', ')
    name, cohort = array
  @students.push( {name: name, cohort: cohort.to_sym} )  
  end
  file.close
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

try_load_students
interactive_menu