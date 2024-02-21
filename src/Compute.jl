# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    hidden_sum = 0;
    codes = Dict{Int64, Int64}();
    
    for (line, model) in models
        new_array = filter(isdigit, model.characters)
        tmp = new_array[1]*new_array[end]
        codes[line] = parse(Int, tmp)
        hidden_sum += parse(Int, tmp)
    end
    
    # return the total -
    return (hidden_sum, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    hidden_sum = 0;
    codes = Dict{Int64, Int64}();

    #Create a dictionary that converts numbers to their Int values
    config_num = Dict("one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)
    # record = models.record
   
    for (line, model) in models
        record_copy = model.record
        for (word, number) in config_num
            if occursin(word, record_copy)
                first_char = word[1] |> string
                last_char = word[end] |> string
                new_string = first_char*word*last_char
                record_copy = replace(record_copy, word => new_string)
                record_copy = replace(record_copy, word => number)
            end
        end
        
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