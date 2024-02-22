"""
    MyPuzzleRecordModel

    record: A given string that you are parsing through 
    characters: An array the size of one containing one character 
    len: the length of the string as an Integer
"""
# TODO: Finish the MyPuzzleRecordModel type
mutable struct MyPuzzleRecordModel
    record::String
    characters::Array{Char, 1}
    len::Int64

    #Initialize it 
    MyPuzzleRecordModel() = new();
end