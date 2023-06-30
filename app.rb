require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      create_person
    end
    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(student_age, student_name, parent_permission)
    @people << student
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_age, teacher_name, teacher_specialization)
    @people << teacher
  end

  def list_people
    if @people.empty?
      puts 'No people to display'
    else
      @people.each { |person| puts "#{person.class}: Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books << book
    puts 'Book created successfully'
  end

  def list_books
    if @books.empty?
      puts 'No books to display'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'There must be at least one book and one person for a rental to take place!'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
      book_id = gets.chomp.to_i
      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_id = gets.chomp.to_i
      puts 'Enter the date in this format yy/mm/dd: '
      date = gets.chomp
      rental = Rental.new(@people[person_id], @books[book_id], date)
      @rental << rental
      puts 'Rental created successfully'
    end
  end

  def rental_list
    if @rental.empty?
      puts 'No rental available'
    else
      puts 'Enter the person ID to get their rental: '
      person_id = gets.chomp.to_i
      person_rental = @rental.select { |rental| rental.person.id == person_id }
      if person_rental.empty?
        puts 'The selected person has no rental'
      else
        person_rental.each do |rental|
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end

  def display_options
    puts 'Please choose an option by entering a number'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rental.'
    puts '7. Exit app'

    option_id = gets.chomp
    run_app(option_id)
    run_app2(option_id)
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  def run_app(option_id)
    case option_id
    when '1' then list_books
    when '2' then list_people
    when '3' then create_person
    else puts 'Choose an existing option!'
         return
    end
    display_options unless option_id == '7'
  end

  def run_app2(option_id)
    case option_id
    when '4' then create_book
    when '5' then create_rental
    when '6' then rental_list
    when '7' then exit_app
    else puts 'Choose an existing option!'
         return
    end
    display_options unless option_id == '7'
  end

  def initial
    puts 'Welcome to School Library App!'
    display_options
  end
end

# app.rb:132:3: C: Metrics/CyclomaticComplexity: Cyclomatic complexity for run_app is too high. [9/7]
#   def run_app(option_id) ...
#   ^^^^^^^^^^^^^^^^^^^^^^
