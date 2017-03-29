node_diagram
============

A small program to manage node_diagrams.


The prompt:

-Reads and interprests text input from a file.
-Builds each node and a node diagram.

Two objects:

-Diagram:
 -Initialized with the input's file path, this msut be in the form of links in the form of 2 letters and a number, where the first letter is the origin node, the second is the destination node, and the number is the value of the link. Each link is separated by a coma and a space or a line break. i.e: "XY5, YZ3, ZX10"

 #path_value: takes an array of nodes and returns the total value of its links.

 #find_paths: takes 2 nodes as input and returns an rray of valid paths between the two nodes. By default it does not allow repetition of nodes.

 #min_path: takes 2 nodes as input and returns a hash containing smallest path and its value.

 #max_path: takes 2 nodes as input and returns a hash containing the largest path and its value.

-Node:
 - A simple stucture containing the lable of the node, and the links. 


