module Scramble
    extend self

    @move_types = [
        "F", "F'", "B", "B'", "L", "L'",
        "R", "R'", "U", "U'", "D", "D'"
    ]

    # To prevent unnecessary moves, e.g. sequential F and F',
    # each move has only some possible successors. The easy way
    # is to use only movements that will permute the previous.
    @successors = {
        "F"  => ["L", "L'", "R", "R'", "U", "U'", "D", "D'"],
        "F'" => ["L", "L'", "R", "R'", "U", "U'", "D", "D'"],
        "B"  => ["L", "L'", "R", "R'", "U", "U'", "D", "D'"],
        "B'" => ["L", "L'", "R", "R'", "U", "U'", "D", "D'"],
        "L"  => ["F", "F'", "B", "B'", "U", "U'", "D", "D'"],
        "L'" => ["F", "F'", "B", "B'", "U", "U'", "D", "D'"],
        "R"  => ["F", "F'", "B", "B'", "U", "U'", "D", "D'"],
        "R'" => ["F", "F'", "B", "B'", "U", "U'", "D", "D'"],
        "U"  => ["F", "F'", "B", "B'", "L", "L'", "R", "R'"],
        "U'" => ["F", "F'", "B", "B'", "L", "L'", "R", "R'"],
        "D"  => ["F", "F'", "B", "B'", "L", "L'", "R", "R'"],
        "D'" => ["F", "F'", "B", "B'", "L", "L'", "R", "R'"]
    }

    def random_move
        mi = rand(0..11)
        return @move_types[mi]
    end

    def random_successor(move_type)
        mi = rand(0..7)
        return @successors[move_type][mi]
    end

    def get_random_moves(count)
        move  = random_move
        moves = []
       
        # Generate the moves
        count.times do
            moves << move
            move = random_successor(move)
        end

        # Convert to string
        str = ""
        moves.each do |move|
            str << "#{move} "
        end
        
        return str
    end
end
