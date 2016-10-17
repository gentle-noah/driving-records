## Running This Example

Please clone this repository running `git clone git@github.com:gentle-noah/driving-records.git`
from your preferred terminal application and navigate into the main folder
using `cd driving-records`. Don't forget to run a `bundle install` if you want to
run the tests!

Once completed you can run the program by executing `ruby index.rb <your-data-file-here>`.
If you do not have a data file that meets the specifications outlined below in the
"Problem Statement" section. Please feel free to run `ruby index.rb spec/data/index.txt`
from terminal to use an example data set provided in this repository.

## Running Tests

All tests are located in the 'spec' folder. They leverage rspec. Please execute
`rspec spec` from terminal to run all tests.

## Problem Statement

Let's write some code to track driving history for people.

The code will process an input file. You can either choose to accept the input via stdin (e.g. `cat input.txt | ruby yourcode.rb`), or as a file name given on the command line (e.g. `ruby yourcode.rb input.txt`).

Each line in the input file will start with a command. There are two possible commands.

The first command is Driver, which will register a new Driver in the app. Example:

`Driver Dan`

The second command is Trip, which will record a trip attributed to a driver. The line will be space delimited with the following fields: the command (Trip), driver name, start time, stop time, miles driven. Times will be given in the format of hours:minutes. We'll use a 24-hour clock and will assume that drivers never drive past midnight (the start time will always be before the end time). Example:

`Trip Dan 07:15 07:45 17.3`

Discard any trips that average a speed of less than 5 mph or greater than 100 mph.

Generate a report containing each driver with total miles driven and average speed. Sort the output by most miles driven to least. Round miles and miles per hour to the nearest integer.

Example input:

```
Driver Dan
Driver Alex
Driver Bob
Trip Dan 07:15 07:45 17.3
Trip Dan 06:12 06:32 12.9
Trip Alex 12:01 13:16 42.0
```

Expected output:

```
Alex: 42 miles @ 34 mph
Dan: 30 miles @ 36 mph
Bob: 0 miles
```
