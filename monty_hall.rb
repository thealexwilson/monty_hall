class MontyHall
  attr_reader :amount_to_run

  def initialize(amount_to_run)
    @amount_to_run = amount_to_run
    @switch_win_counter = 0
    @initial_win_counter = 0
  end

  def run
    amount_to_run.times do |_time|
      monty_hall
    end

    results
  end

  def switch_win_percentage
    (@switch_win_counter.to_f / amount_to_run.to_f) * 100
  end

  def initial_win_percentage
    (@initial_win_counter.to_f / amount_to_run.to_f) * 100
  end

  private

  def monty_hall
    doors = %w(goat1 goat2 car).shuffle!

    contestant_initial_choice = doors.sample
    doors.delete(contestant_initial_choice)

    doors.each do |choice|
      if choice == 'goat1' || choice == 'goat2'
        doors.delete(choice)
        break
      end
    end

    contestant_final_choice = doors

    if contestant_final_choice.first == 'car'
      @switch_win_counter += 1
    end

    if contestant_initial_choice == 'car'
      @initial_win_counter += 1
    end
  end

  def results
    puts "Run #{amount_to_run} times, #{@switch_win_counter} wins if contestant switched, switch win % = #{sprintf('%.2f', switch_win_percentage)}%"
    puts "Run #{amount_to_run} times, #{@initial_win_counter} wins if contestant did not switch, no switch win % = #{sprintf('%.2f', initial_win_percentage)}%"
  end
end