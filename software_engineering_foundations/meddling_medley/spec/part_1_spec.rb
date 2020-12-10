require "part_1"

describe "PHASE 1" do
    describe "duos" do
        it "should accept a string as an argument" do
            expect { duos('bootcamp') }.to_not raise_error
        end

        it "should return the count of the number of times the same character appears consecutively in the given string" do
            expect(duos('bootcamp')).to eq(1)
            expect(duos('wxxyzz')).to eq(2)
            expect(duos('hoooraay')).to eq(3)
            expect(duos('dinosaurs')).to eq(0)
            expect(duos('e')).to eq(0)
        end
    end

    describe "sentence_swap" do
        it "should accept a sentence and a hash as arguments" do
            expect { sentence_swap('anything you can do I can do', 'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall') }.to_not raise_error
        end

        it "should return a new sentence where every word is replaced with it's corresponding value in the hash." do
            expect(sentence_swap('anything you can do I can do',
                'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
            )).to eq('nothing you shall drink I shall drink')
            
            expect(sentence_swap('what a sad ad',
                'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
            )).to eq('make a happy ad')
            
            expect(sentence_swap('keep coding okay',
                'coding'=>'running', 'kay'=>'pen'
            )).to eq('keep running okay')
        end
    end

    describe "hash_mapped" do
        it "should accept a hash, a pr0c and a block" do
            expect { hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' } }.to_not raise_error
        end

        it "should return a new hash where each key is the result of the original key when given to the block." do
            double = Proc.new { |n| n * 2 }
            expect(hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
            ).to eq({"A!!"=>8, "X!!"=>14, "C!!"=>-6})
            
            first = Proc.new { |a| a[0] }
            expect(hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
            ).to eq({25=>"q", 36=>"w"})
        end
    end

    describe "counted_characters" do
        it "should accept a string as an argument" do
            expect { counted_characters("that's alright folks") }.to_not raise_error
        end

        it "should return an array containing the characters of the string that appeared more than twice." do
            expect(counted_characters("that's alright folks")).to eq(["t"])
            expect(counted_characters("mississippi")).to eq(["i", "s"])
            expect(counted_characters("hot potato soup please")).to eq(["o", "t", " ", "p"])
            expect(counted_characters("runtime")).to eq([])
        end
    end

    describe "triplet_true?" do
        it "should accept a string as an argument" do
            expect { triplet_true('caaabb') }.to_not raise_error
        end

        it "should return a boolean indicating whether or not the sting contains three of the same character consecutively" do
            expect(triplet_true('caaabb')).to eq(true)
            expect(triplet_true('terrrrrible')).to eq(true)
            expect(triplet_true('runninggg')).to eq(true)
            expect(triplet_true('bootcamp')).to eq(false)
            expect(triplet_true('e')).to eq(false)
        end
    end

    describe "energetic_encoding" do
        it "should accept a sting and a hash as arguments" do
            expect { energetic_encoding('sent sea', 'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u') }.to_not raise_error
        end

        it "should return a new string where characters of the original string are replaced with the corresponding values in the hash." do
            expect(energetic_encoding('sent sea',
                'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
            )).to eq('zimp ziu')
        
            expect(energetic_encoding('cat',
                'a'=>'o', 'c'=>'k'
            )).to eq('ko?')
            
            expect(energetic_encoding('hello world',
                'o'=>'i', 'l'=>'r', 'e'=>'a'
            )).to eq('?arri ?i?r?')
            
            expect(energetic_encoding('bike', {})).to eq('????')
        end
    end

    describe "uncompress" do
        it "should accept a string as an argument" do
            expect {}.to_not raise_error
        end

        it " should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter." do
            expect(uncompress('a2b4c1')).to eq('aabbbbc')
            expect(uncompress('b1o2t1')).to eq('boot')
            expect(uncompress('x3y1x2z4')).to eq('xxxyxxzzzz')
        end
    end
end

