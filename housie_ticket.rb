def generate_housie_ticket
    ticket = Array.new(3) { Array.new(9) { "" } }
    numbers = (1..90).to_a.shuffle  # Shuffle numbers from 1 to 90 for randomness
   
    ticket.each do |row|
      random_column_cells = row.length.times.to_a.shuffle.take(5)  # Get 5 random column cells
     
      random_column_cells.each do |col_index|
        # Pop the last element from the shuffled numbers to ensure uniqueness
        row[col_index] = numbers.pop
      end
    end
   
    # Replace empty cells with "X"
    ticket.map! { |row| row.map { |cell| cell == "" ? "X" : cell } }
   
    ticket.map! do |row|
      sorted_row = row.reject { |cell| cell == "X" }.sort  # Sort non-empty cells
      row.map { |cell| cell == "X" ? "X" : sorted_row.shift }  # Replace non-empty cells with sorted non-empty cells
    end

    # Print the ticket
    ticket.each do |row|
      puts row.join(" | ")
    end
end

generate_housie_ticket
