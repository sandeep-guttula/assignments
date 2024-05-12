=begin
    Write a Program that creates a file and folder structure for a given user
    Input:
    Enter Folder Name: “Folder”
    Enter File Name: “File 1.txt”
    What do you want to write in the file? - “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. Non arcu risus quis varius quam quisque id. Enim sed faucibus turpis in eu mi bibendum neque egestas. Nunc sed velit dignissim sodales ut eu sem integer.”
    Do you want to continue (Y/N)? Y
    Do you want to create/update/delete a given file? - create
    Enter File Name: “File 2.txt”
    What do you want to write in the file? - “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. Non arcu risus quis varius quam quisque id. Enim sed faucibus turpis in eu mi bibendum neque egestas. Nunc sed velit dignissim sodales ut eu sem integer.”
    Do you want to continue (Y/N)? Y
    Do you want to create/update/delete a given file? - update
    Enter File Name: “File 2.txt”
    What do you want to write in the file? - “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. Non arcu risus quis varius quam quisque id. Enim sed faucibus turpis in eu mi bibendum neque egestas. Nunc sed velit dignissim sodales ut eu sem integer.”
    Do you want to continue (Y/N)? Y
    Do you want to create/update/delete a given file? - delete
    Enter File Name: “File 2.txt”
    Do you want to continue (Y/N)? N
    This should run in a continuous loop until the user decides to exit the program
=end



class FileOperations

    def createFile(folder_name, fileName, fileContent)
        Dir.mkdir(folder_name) unless File.exists?(folder_name)
        File.open("#{folder_name}/#{fileName}", 'w') do |file|
            file.write(fileContent)
        end
    end

    def updateFile(folder_name, fileName, fileContent)
        File.open("#{folder_name}/#{fileName}", 'w') do |file|
            file.write(fileContent)
        end
    end

    def deleteFile(folderName, fileName)
        File.delete("#{folderName}/#{fileName}")
    end
end

files = FileOperations.new


puts "Enter Folder Name: "

folder_name = gets.chomp

puts "Enter File Name: "

file_name = gets.chomp

puts "What do you want to write in the file?"
file_data = gets.chomp
files.createFile(folder_name, file_name, file_data)
    



loop do
    
    puts "Do you want to continue (Y/N)?"

    continue = gets.chomp

    break if continue == 'N' || continue == 'n'

    puts "Do you want to create/update/delete a given file? - create/update/delete"
    operation = gets.chomp.downcase
    case operation
    when 'create'
        puts "Enter File Name: "
        file_name = gets.chomp
        puts "What do you want to write in the file?"
        file_data = gets.chomp
        files.createFile(folder_name, file_name, file_data)
    when 'update'
        puts "Enter File Name: "
        file_name = gets.chomp
        puts "What do you want to write in the file?"
        file_data = gets.chomp
        files.updateFile(folder_name, file_name, file_data)
    when 'delete'
        puts "Enter File Name: "
        file_name = gets.chomp
        files.deleteFile(folder_name, file_name)
    else
        puts "Invalid operation"
    end

    puts "Do you want to continue (Y/N)?"

    continue = gets.chomp
    break if continue == 'N' || continue == 'n'
end