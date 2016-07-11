#******************************************************************************
# Created by:   Björn G. D. Persson (Kilted Viking)
# Created:      2016-05-30
# Comments:     This file was created while watch course at coursera.org.
# Prerequisites:
#       * Install gems mongo and bson_ext before running this code.
#       * Also start MongoDB server. ;-)
#******************************************************************************

#Import mongo client
require 'mongo'
#Set logging to a minimum, i.e. remove debbugging info
Mongo::Logger.logger.level = ::Logger::INFO

#Connect to server and set database to use
client = Mongo::Client.new('mongodb://localhost:27017')
db = client.use('test')

puts "Database name: #{db.database.name}"

#Get first document (i.e. db.zips.findOne())
doc = db[:zips].find.first

puts doc