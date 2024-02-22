
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types

function build(record::String)::MyPuzzleRecordModel
    model = MyPuzzleRecordModel()

    #Collects all the characters in record and turns them into an array
    model.characters = collect(record)

    #assigns the length of the model to equal the length of the record
    model.len = length(record)

    #sets the record of the model to equal record
    model.record = record
    return model
end
# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #