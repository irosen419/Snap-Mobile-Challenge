class Calculator

  def initialize(current_value = 0, nums = [], operators = [])
    @current_value = current_value
    @nums = nums
    @operators = operators
  end

  #begin the experience
  def start
    puts @current_value
    input()
  end

  #get user input and validate each input
  def input
    user_input = gets.strip!
    
    begin
      if user_input == 'q'
        quit
        return
      end

      input_array = breakdown_user_input(user_input)

      input_array.each do |value|
        validNumber(value)
      end

      # iterate over nums array calculating each with next operator
      @nums.each_with_index do |num, idx|
        if idx == 0 || @operators.empty?
          @current_value = num
        else
          @current_value = calculate(@current_value, num, @operators.shift)
        end
      end
      puts @current_value
      input
    rescue NoMethodError, SystemExit, Interrupt
      quit
    end
  end

  #splits user input into array
  def breakdown_user_input(user_input)
    input_array = user_input.split(" ")
  end

  # first validate for numbers (ints or floats)
  def validNumber(value)
    begin
      result = Float(value)
      @nums.push(result)
    rescue ArgumentError, TypeError
      # then validate operators
      validOperator(value)
    end
  end

  # validate operators
  def validOperator(value)
    validOperators = ['+', '-', '*', '/']
    
    if validOperators.include?(value)
      @operators.push(value)
    else
      puts "Invalid operation. Please try again."
      input
    end
  end

  # calculate with the current operator
  def calculate(a = 1, b = 1, operator)
    case operator
    when '+'
      return a + b
    when '-'
      return a - b
    when '*'
      return a * b
    when '/'
      return a / b
    end
  end

  def quit
    puts "\n\n  We are sorry to see you go!  "
    puts "     Art by Joan G. Stark       "
    puts "            |\\._                "
    puts "            |  o o__             "
    puts "             \\   _.3            "
    puts "        ,    `) (               "
    puts "        )\\   /__\\__            "
    puts "       / /  / -._);_)           "
    puts "      |  `\\/  \ __|\            "
    puts "       \\  ;    ) / )           "
    puts "       `\\|   /__/ /__          "
    puts "     jgs `\\______)___)         "
    puts "   Please come back again!      "
  end

end