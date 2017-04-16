# Simple Warehouse
`ruby runner.rb`

command help

```
> help
help             Shows this help message
init W H         (Re)Initialises the application as a W x H warehouse, with all spaces empty.
store X Y W H P  Stores a crate of product number P and of size W x H at position X,Y.
locate P         Show a list of positions where product number can be found.
remove X Y       Remove the crate at positon X,Y.
view             Show a representation of the current state of the warehouse, marking each position as filled or empty.
exit             Exits the application.
```
Let's create warehouse with width 20 and height 10

````
> init 20 10
New warehouse of width: 20 and height: 10 created
> view
....................                    
....................                    
....................                    
....................                    
....................                    
....................                    
....................                    
....................                    
....................                    
....................
````

Let store some crates

````
> store 1 1 2 2 A
New crate of width: 2 and height: 2 created
> store 1 3 2 3 B
New crate of width: 2 and height: 3 created
> store 3 1 5 5 C
New crate of width: 5 and height: 5 created
> store 9 1 3 3 C
New crate of width: 3 and height: 3 created
> view
....................                    
....................                    
....................                    
....................                    
....................                    
BBCCCCC.............                    
BBCCCCC.............                    
BBCCCCC.CCC.........                    
AACCCCC.CCC.........                    
AACCCCC.CCC.........  
> store 30 30 2 2 D
Cannot store crate: position doesn't exist or crate does not fit
> store 1 1 10 10 E
Cannot store crate: crate overlap existing crate
````

Let locate crates

````
> locate A
Crate A at X:1 Y:1 with W:2 H:2
> locate C
Crate C at X:3 Y:1 with W:5 H:5
Crate C at X:9 Y:1 with W:3 H:3
````

Let remove crate

````
> remove 1 1
Crate A removed from the warehouse
> view
....................                    
....................                    
....................                    
....................                    
....................                    
BBCCCCC.............                    
BBCCCCC.............                    
BBCCCCC.CCC.........                    
..CCCCC.CCC.........                    
..CCCCC.CCC.........                    
> remove 10 2
Crate C removed from the warehouse
> view
....................                    
....................                    
....................                    
....................                    
....................                    
BBCCCCC.............                    
BBCCCCC.............                    
BBCCCCC.............                    
..CCCCC.............                    
..CCCCC............. 
````

## App structure
The app has modular structure based on command pattern. You can easily add new command or remove existing. 
Or have different behaviour of the same command for different objects.

All data are stored in the text file. Commands reads file, execute code and save results back.

All string constants placed in the `simple_warehouse_constants.rb` for simple use and modification

### Models

App has three models
- `crate` - model represents crate object with positions, dimension and name attributes
- `position` - model represents position object. Main purpose for overlap functions with warehouse or other crate
- `warehouse` - model represents warehouse 

### Services

App has seven services
- `command_parser` - service for parse commands and parameters from provided string
- `commands_executor` - service for match and execute commands
- `warehouse_locator` - service for finding product
- `warehouse_reader` - service for read data from the text file
- `warehouse_remover` - service for remove crate from warehouse
- `warehouse_storer` - service for storing crate in the warehouse
- `warehouse_viewer` - service for viewing 2D representation of the warehouse

### Data

Data are stored in the file `warehouse.txt`

````
20 10 (1)
2 (2)
1 3 2 3 B (3)
3 1 5 5 C
.................... (4)                    
....................                    
....................                    
....................                    
....................                    
BBCCCCC.............                    
BBCCCCC.............                    
BBCCCCC.............                    
..CCCCC.............                    
..CCCCC............. 
````

(1) - width and height of warehouse;
(2) - number of crates;
(3) - list of crates: position, width, height and name;
(4) - text visualization of warehouse

### Tests

I use TDD process & manual execution when developing this application
Test coverage is not 100% but at least it cover major critical functionality

````
Testing started at 16:22 ...
Work directory: /home/terminator/dev/simple_warehouse
Loading files.... 
=========================================
1. /home/terminator/dev/simple_warehouse/test/services/test_warehouse_storer.rb:1
2. /home/terminator/dev/simple_warehouse/test/services/test_warehouse_remover.rb:1
3. /home/terminator/dev/simple_warehouse/test/services/test_command_parser.rb:1
4. /home/terminator/dev/simple_warehouse/test/services/test_commands_executor.rb:1
5. /home/terminator/dev/simple_warehouse/test/test_helper.rb:1
6. /home/terminator/dev/simple_warehouse/test/models/test_position.rb:1
7. /home/terminator/dev/simple_warehouse/test/models/test_warehouse.rb:1
8. /home/terminator/dev/simple_warehouse/test/models/test_crate.rb:1
 
8 files were loaded.
=========================================
Running tests...
Started

Cannot store crate: position doesn't exist or crate does not fit
Cannot store crate: crate overlap existing crate
New crate of width: 2 and height: 2 created
Crate A removed from the warehouse
There is no any crate at this position
Finished in 0.00905s
18 tests, 37 assertions, 0 failures, 0 errors, 0 skips
````

### Future improvements

- different data files for different warehouses
- save data in the relation database
- log user inputs and app messages
- introduce not 2D but 3D warehouse structure
- validate user input
- more integration tests
- better view of warehouse
- move save code from warehouse to service




