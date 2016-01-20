require 'time'
require 'io/console'

puts "Thank you for using the Driver Report Creation Tool by Michael Timberg."
puts "Please refer to README.txt before first use."
puts "Enter the pathname to the file you wish to be read below :"

input = IO.readlines(gets.chomp)

driversMi = {}
driversMPH = {}

for string in input
    line = string.split
    command = line[0]
    case command
    when "Driver"
        # either creates a method or class here
        driversMi["#{line[1]}"] = [0]
        driversMPH["#{line[1]}"] = []
    when "Trip"
        start = Time.parse(line[2])
        finish = Time.parse(line[3])
        hours = (finish - start)/3600
        miles = ((line[4].to_f).round).to_i
        mph = (miles / hours).round
        if mph > 5 and mph < 100
            driversMi["#{line[1]}"] << miles
            summi = driversMi["#{line[1]}"].reduce(:+)
            driversMi["#{line[1]}"] = [] << summi
            driversMPH["#{line[1]}"] << mph
            #puts "#{line[1]}: #{miles} miles @ #{mph} mph"
            avgmph = driversMPH["#{line[1]}"].reduce(:+).to_i / driversMPH["#{line[1]}"].size
            driversMPH["#{line[1]}"] = [] << avgmph
        end
    end
end

driversMi = (driversMi.sort_by { |dmi| dmi[1] }).reverse

puts "Creating Report.txt in the parent directory."

output = File.new("Report.txt", "w")

driversMi.each do |key, array|
    driversMi.sort_by { |a, b| a[0] <=> b[0] }
    driversMPH.each do |key2, array2|
        if key === key2
            if array.inject{|a,i| a*10 + i} === 0
                output.puts("#{key}: #{array.inject{|a,i| a*10 + i}} miles")
            else
                output.puts("#{key}: #{array.inject{|a,i| a*10 + i}} miles @ #{array2.inject{|a,i| a*10 + i}} mph")
            end
        end
    end
end

output.close