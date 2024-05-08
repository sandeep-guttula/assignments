=begin
    Write a Program that takes Date/Time as an input (in DD-MM-YYYY HH:MM format) and displays the same in the following formats:
    Input: 08-05-2024 11:26
    Output:
    Format #1: Wed, 8 May, 2024
    Format #2: 05/08/2024
    Format #3: 11:26 AM, Wednesday 08 May, 2024
    Please use functions provided by Ruby Date,Time and DateTime classes here
=end

require 'date' 


def date_and_time(date_time)

    
    format_01 =  date_time.strftime('%a, %d %b, %Y')

    format_02 = date_time.strftime('%d/%m/%Y')

    format_03 = date_time.strftime('%l:%M %p, %A %d %B %Y')

    puts format_01
    puts format_02
    puts format_03
end

date_and_time(DateTime.now) 