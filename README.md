# Knights_Travails_Ruby
Given a standard 8 x 8 chessboard where each position is indicated in algebraic notation (with the lower left corner being a1), design a class showing the shortest path for a Chess Knight from a starting position to an end position.

## Learning Goals
* Be able to implement PolyTreeNode to build a path from start to finish
* Know how to store and traverse a tree
* Know when and why to use Breadth First Search (BFS) versus Depth First Search (DFS)

### Phase 0: Description
In this project, I will create a class that will find the shortest path for a Chess Knight from a starting position to an end position. Both the start and end positions should be on a standard 8x8 chess board.

This pathfinder algorithm looks very similar to word chains!

I will have to first write a class ```KnightPathFinder``` that will initialize with a ```start_pos``` starting position.

Moves can be represented as a tree. The values in the tree are positions. A node is a child of a nother node if you can move from the parent to the child position. ```PolyTreeNode``` instances will represent each position.

The instance variable ```@root_node``` stores the knight's initial position in an instance of ```PolyTreeNode``` class.

```KnightPathFinder#build_move_tree``` will build the move tree, which begins with ```self.root_node```. I will need to invoke ```#build_move_tree``` in ```initialize```. We traverse the move tree whenever we invoke ```#find_path```.

### Phase 1: #new_move_positions
Before building ```#build_move_tree```, I need to find positions I can move to from a given position. A class method ```KnightPathFinder::valid_moves(pos)``` will check for up to 8 possible moves.

We don't want repating positions in the move tree. For example, we won't move constantly between the same two positions (infinite cycling), so we need an instance variable ```@considered_positions``` to keep track of the positions considered. We can initialize that to the array containing the starting position. The instance method ```KnightPathFinder#new_move_positions(pos)``` should call the ```::valid_moves``` class method, while filtering out any positions in the ```@considered_positions```. Then, it should add remaining new positions to ```@considered_positions``` and return these new positions.

### Phase 2: #build_move_tree
```#build_move_tree``` will use ```#new_move_positions``` instance method.

THe move tree will represent ONLY the shortest path to a given position on the board, so the tree will be built using breadth-first search. Looking at a BFS Algorithm, we use a queue to process nodes in "First In, First Out" order. I will start with a root node representing the ```start_pos``` and explore moves from one position at a time.

After that, I can build nodes representing positions one move away, then add them to the queue. Then I would take the next node from the queue until the queue is empty.

### Phase 3: #find_path
The move tree stored in ```@root_node``` is our internal data structure, and we can traverse it to find the shortest path to any position on our 8x8 board from the original ```@start_pos```.

I will need to create instance method ```KnightPathFinder#find_path(end_pos)``` to search for ```end_pos``` in the move tree. I can use either ```dfs``` or ```bfs``` to do it, but I will use ```dfs``` in my implementation. ```#find_path(end_pos)``` will return the tree node instance of ```PolyTreeNode``` that contains ```end_pos```.

After returning the node that contains ```end_pos```,  it is time to define a method ```#trace_path_back``` on ```KnightPathFinder```. This will trace back from the node to the ```@root_node``` using ```PolyTreeNode#parent```. It will add each value to an array as it goes up toward the root. ```#trace_path_back``` should return the values in order, from the start position to the end position, so I may have to ```Array.reverse``` on its return.

```#trace_path_back``` will be the final line of ```#find_path``` to return a value.

### Tests that can be run in a REPL
```
kpf = KnightPathFinder.new([0, 0])
kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
```

### License Information

```
    Knights Travails - Shortest Path for Chess Knight on 8x8 Board
    Copyright (C) 2020  Mark Calvelo

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```