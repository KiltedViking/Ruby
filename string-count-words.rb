#******************************************************************************
# Purpose:      Count number of times a word occurs in a string.
# Created by:   Björn G. D. Persson (bjorn(at)kiltedviking.net.nospam)
# Created:      2016-05-07
# Comments:     This code was written by author to learn Ruby, i.e. should not
#               be seen as most optimal solution. ;-)
#******************************************************************************
myText = "Hello world. How is Trix? Hello hello"
myHash = Hash.new
myArray = myText.split

#For each string in array - assign string to variable s
myArray.each { 
    | s | 
    
    #Convert to lower case and remove any non-alphanumeric characters
    str = s.downcase.gsub(/[^a-z ]/, '')

    #Get number of times string has occured (so far)    
    nb = myHash[str]

    #If nb is nil - first time string occured - add with value 1    
    if nb == nil
        myHash[str] = 1
    else    #... else increase nb and put back new value
        nb = nb + 1
        myHash[str] = nb
    end
}

#Output hash, i.e. string and number of times it occured
puts myHash