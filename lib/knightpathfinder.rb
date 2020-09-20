require_relative 'polytreenode'

class KnightPathFinder 
    # setter for root_node instance variable
    attr_accessor :root_node, :considered_positions
    # Matrix represents 8 x 8 grid
    MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]
    
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]

        build_move_tree
    end

    def self.valid_moves(pos)
        row = pos.first # first element of pos
        col = pos.last # second element of pos

        new_moves = MOVES.map do |move|
            if (row + move.first).between?(0, 7) && (col + move.last).between?(0, 7) # if one of 8 valid moves
                [row + move.first, col + move.last] # add the move to the current row and column of pos
            end
        end
        new_moves.reject { |ele| ele.nil? } # filter nil values from new_moves and return
    end

    def new_move_positions(pos)
        # Slice all moves that are valid moves into new_positions array
        new_positions = KnightPathFinder.valid_moves(pos).select { |position| !@considered_positions.include?(position) }
        @considered_positions += new_positions # append new positions to the @considered_positions instance variable
        return new_positions
    end

    def build_move_tree
       queue = [@root_node] # instance variable is the first element of the queue
       
       until queue.empty? # while queue still has at least one element
        current_node = queue.shift # current_node splice out the first element of queue
        new_move_positions(current_node.value).each do |new_position|
            child_node = PolyTreeNode.new(new_position) # instantiate child_node
            current_node.add_child(child_node) # set child_node.parent to current_node
            queue << child_node # push child_node into the end of the queue
        end
       end
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos) # use dfs to search for end_pos in the move tree
        trace_path_back(end_node) # returns the found path as an array from start to finish
    end

    def trace_path_back(end_node)
        path = [] # hold all nodes in the backwards path in an array
        current_node = end_node # start at the end_node
        until current_node.nil? # while current_node is not a nil value (has a parent to go up)
            path << current_node.value # push the current_node value property in the path array
            current_node = current_node.parent # go up the tree to the parent (if there is still one more level up)
        end

        path.reverse # return the path array in order from start to end
    end

end

# Test case
kpf = KnightPathFinder.new([0, 0])
print kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]