# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

Parses through the characters of all the model(s) in models and for each model takes the first and last Int and 
combines them. Then it uses the line number as the key for the combined two numbers in the dictionary. Finally it adds
the two numbers to hidden_sum and loops through all model(s).
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    hidden_sum = 0;
    codes = Dict{Int64, Int64}();
    
    #models is made up of many model(s) so go through each model in models
    for (line, model) in models
        
        #Create a new array only characters that are digits, retaining the order 
        new_array = filter(isdigit, model.characters)
       
       # creates a new array of one with the value being the first and last digits in new_arry concatanted together
        tmp = new_array[1]*new_array[end]
        
        # assigns the line number its on to be the key for the two digits which have been converted to Ints
        codes[line] = parse(Int, tmp)

        #add the two digits to the hidden_sum that have been converted to Ints
        hidden_sum += parse(Int, tmp)
    end
    
    # return the total -
    return (hidden_sum, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

    Converts all viable words into numbers and loops through while making duplicates of first and last letters of 
    number words in order to account for edge cases and overlapping numbers
    Parses through the characters of all the model(s) in models and for each model takes the first and last Int and 
    combines them. Then it uses the line number as the key for the combined two numbers in the dictionary. Finally it adds
    the two numbers to hidden_sum and loops through all model(s).
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    hidden_sum = 0;
    codes = Dict{Int64, Int64}();

    #Create a dictionary that converts numbers to their Int values
    config_num = Dict("one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)
   
    #iterates through each model in models
    for (line, model) in models
        #creates a copy of the record of the current iteration of model
        record_copy = model.record

        #iterates through each word in "number" (the key) in the dictionary config_num
        for (word, number) in config_num

            #continues if any of the words in config_num are found within the copy of record
            if occursin(word, record_copy)
                #finds the first character of the word, converts to string
                first_char = word[1] |> string
                #finds the last character of the word, converts to string
                last_char = word[end] |> string
                #creates a new string of the first character, the word, and the last character added together
                new_string = first_char*word*last_char
                #replaces the current record copy words with the new_string version
                record_copy = replace(record_copy, word => new_string)
                #replaces the new string version of the word with the corresponding numbers in the dictionary
                record_copy = replace(record_copy, word => number)
            end
        end
        
        #essentially calling decode_part_1 for each model after creating the new record 
        new_array = filter(isdigit, record_copy)
        tmp = new_array[1]*new_array[end]
        codes[line] = parse(Int, tmp)
        hidden_sum += parse(Int, tmp)
    end


    # TODO: Add the logic for part 2 here
    # ...
     
     # return the total -
     return (hidden_sum, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #