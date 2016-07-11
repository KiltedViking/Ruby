#!/usr/bin/env ruby

#Run script by typing files name in command line (./<filename>)
#(Scripts x attribute needs to be set, i.e. running chmod +x <filename>)

str = "Hello world\n"

print str
# print argv

def my_function
  print "Called my_function\n"
end

my_function
