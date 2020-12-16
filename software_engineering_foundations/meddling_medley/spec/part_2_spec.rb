require "part_2"

describe "PHASE 2" do
    describe "conjunct_select" do
        it "should accept and array and one or more procs as arguments" do
            is_positive = Proc.new { |n| n > 0 }

            expect {conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive)}.to_not raise_error
        end

        it " should return a new array containing the elements that return true when passed into all of the given procs." do
            is_positive = Proc.new { |n| n > 0 }
            is_odd = Proc.new { |n| n.odd? }
            less_than_ten = Proc.new { |n| n < 10 }
            
            expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive)).to eq([4, 8, 11, 7, 13])
            expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd)).to eq([11, 7, 13])
            expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten)).to eq([7])
        end
    end

    describe "convert_pig_latin" do
        it "should accept a sentence as an argument" do
            expect { convert_pig_latin('We like to eat bananas') }.to_not raise_error
        end

        it "should translate the sentence" do
            expect(convert_pig_latin('We like to eat bananas')).to eq("We ikelay to eatyay ananasbay")
            expect(convert_pig_latin('I cannot find the trash')).to eq("I annotcay indfay ethay ashtray")
            expect(convert_pig_latin('What an interesting problem')).to eq("Atwhay an interestingyay oblempray")
            expect(convert_pig_latin('Her family flew to France')).to eq("Erhay amilyfay ewflay to Ancefray")
            expect(convert_pig_latin('Our family flew to France')).to eq("Ouryay amilyfay ewflay to Ancefray")
        end
    end

    describe "reverberate" do
        it "should accept a sentence as an argument" do
            expect { reverberate('We like to go running fast') }.to_not raise_error
        end

        it "should translate the sentence" do
            expect(reverberate('We like to go running fast')).to eq("We likelike to go runninging fastast")
            expect(reverberate('He cannot find the trash')).to eq("He cannotot findind thethe trashash")
            expect(reverberate('Pasta is my favorite dish')).to eq("Pastapasta is my favoritefavorite dishish")
            expect(reverberate('Her family flew to France')).to eq("Herer familyily flewew to Francefrance")
        end
    end

    describe "disjunct_select" do
        it "should accept an array and one or more procs as arguments" do
            longer_four = Proc.new { |s| s.length > 4 }

            expect { disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'], longer_four) }.to_not raise_error
        end

        it "should return a new array containing the elements that return true when passed into at least one of the given procs." do
            longer_four = Proc.new { |s| s.length > 4 }
            contains_o = Proc.new { |s| s.include?('o') }
            starts_a = Proc.new { |s| s[0] == 'a' }
            
            expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
                longer_four,
            )).to eq(["apple", "teeming"])
            
            expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
                longer_four,
                contains_o
            )).to eq(["dog", "apple", "teeming", "boot"])
            
            expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
                longer_four,
                contains_o,
                starts_a
            )).to eq(["ace", "dog", "apple", "teeming", "boot"])
        end
    end

    describe "alternating_vowel" do
        it "should accept a sentence as an argument" do
            expect { alternating_vowel('panthers are great animals') }.to_not raise_error
        end

        it "should return a new sentence where the words alternate between having their first or last vowel removed." do
            expect(alternating_vowel('panthers are great animals')).to eq("pnthers ar grat animls")
            expect(alternating_vowel('running panthers are epic')).to eq("rnning panthrs re epc")
            expect(alternating_vowel('code properly please')).to eq("cde proprly plase")
            expect(alternating_vowel('my forecast predicts rain today')).to eq("my forecst prdicts ran tday")
        end
    end

    describe "silly_talk" do
        it "should accept a sentence as an argument" do
            expect { silly_talk('Kids like cats and dogs') }.to_not raise_error
        end

        it "should translate each word of the sentence" do
            expect(silly_talk('Kids like cats and dogs')).to eq("Kibids likee cabats aband dobogs")
            expect(silly_talk('Stop that scooter')).to eq("Stobop thabat scobooboteber")
            expect(silly_talk('They can code')).to eq("Thebey caban codee")
            expect(silly_talk('He flew to Italy')).to eq("Hee flebew too Ibitabaly")
        end
    end

    describe "compress" do
        it "should accepts a string as an argument" do
            expect {}.to_not raise_error
        end

        it "should return a compressed version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak." do
            expect(compress('aabbbbc')).to eq("a2b4c")
            expect(compress('boot')).to eq("bo2t")
            expect(compress('xxxyxxzzzz')).to eq("x3yx2z4")
        end
    end
end