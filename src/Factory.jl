
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types

function build(record::String)::MyPuzzleRecordModel
    model = MyPuzzleRecordModel()
    model.characters = collect(record)
    model.len = length(record)
    model.record = record
    return model
end
# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #