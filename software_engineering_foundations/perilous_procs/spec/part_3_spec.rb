require "part_3"

describe "PHASE 3" do
  describe "selected_map!" do
    it "should accept an array and two procs" do
      is_even = Proc.new { |n| n.even? }
      square = Proc.new { |n| n * n }

      expect { selected_map!([8, 5, 10, 4], is_even, square) }.to_not raise_error
    end

    it "should replace the elements that return true when passed into the first proc with their return values when they are passed into the second proc." do
      is_even = Proc.new { |n| n.even? }
      is_positive = Proc.new { |n| n > 0 }
      square = Proc.new { |n| n * n }
      flip_sign = Proc.new { |n| -n }

      arr_1 = [8, 5, 10, 4]
      selected_map!(arr_1, is_even, square)
      expect(arr_1).to be([64, 5, 100, 16])

      arr_2 = [-10, 4, 7, 6, -2, -9]
      selected_map!(arr_2, is_even, flip_sign)
      expect(arr_2).to be([10, -4, 7, -6, 2, -9])

      arr_3 = [-10, 4, 7, 6, -2, -9]
      selected_map!(arr_3, is_positive, square)
      expect(arr_3).to be([-10, 16, 49, 36, -2, -9])
    end
  end

  describe "chain_map" do
    it "should accept any value and an array" do
      add_5 = Proc.new { |n| n + 5 }
      half = Proc.new { |n| n / 2.0 }

      expect { chain_map(25, [add_5, half]) }.to_not raise_error
    end

    it "should return the final value after feeding the value through all of the procs" do
      add_5 = Proc.new { |n| n + 5 }
      half = Proc.new { |n| n / 2.0 }
      square = Proc.new { |n| n * n }

      expect(chain_map(25, [add_5, half])).to eq(15.0)
      expect(chain_map(25, [half, add_5])).to eq(17.5)
      expect(chain_map(25, [add_5, half, square])).to eq(225)
      expect(chain_map(4, [square, half])).to eq(8)
      expect(chain_map(4, [half, square])).to eq(4)
    end
  end

  describe "proc_suffix" do
    it "should accept a sentence and a hash as arguments" do
      contains_a = Proc.new { |w| w.include?('a') }
      three_letters = Proc.new { |w| w.length == 3 }

      expect { proc_suffix('dog cat', contains_a => 'ly', three_letters => 'o') }.to_not raise_error
    end

    it "should return a new sentence where each word of the original sentence is appended with a suffix" do
      contains_a = Proc.new { |w| w.include?('a') }
      three_letters = Proc.new { |w| w.length == 3 }
      four_letters = Proc.new { |w| w.length == 4 }

      expect(proc_suffix('dog cat',
                    contains_a => 'ly',
                    three_letters => 'o'
        )).to eq("dogo catlyo")

      expect(proc_suffix('dog cat',
                    three_letters => 'o',
                    contains_a => 'ly'
        )).to eq("dogo catoly")

      expect(proc_suffix('wrong glad cat',
                    contains_a => 'ly',
                    three_letters => 'o',
                    four_letters => 'ing'
        )).to eq("wrong gladlying catlyo")

      expect(proc_suffix('food glad rant dog cat',
                    four_letters => 'ing',
                    contains_a => 'ly',
                    three_letters => 'o'
        )).to eq("fooding gladingly rantingly dogo catlyo")
    end
  end

  describe "proctition_platinum" do
    it "should accept an array and any number of additional procs as arguments" do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      contains_a = Proc.new { |s| s.downcase.include?('a') }

      expect { proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a) }.to_not raise_error
    end

    it "should return a hash where the keys correspond to the number of procs passed in" do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      is_upcase = Proc.new { |s| s.upcase == s }
      contains_a = Proc.new { |s| s.downcase.include?('a') }
      begins_w = Proc.new { |s| s.downcase[0] == 'w' }

      expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a))
          .to eq({1=>["when!", "WHERE!"], 2=>["what"]})

      expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a))
          .to eq({1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]})

      expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a))
          .to eq({1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]})

      expect(proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a))
          .to eq({1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]})
    end
  end

  describe "procipher" do
    it "should accept a sentence and a hash as arguments" do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      contains_a = Proc.new { |s| s.downcase.include?('a') }
      make_question = Proc.new { |s| s + '???' }
      reverse = Proc.new { |s| s.reverse }

      expect { procipher('he said what!', is_yelled => make_question, contains_a => reverse) }.to_not raise_error
    end

    it "should return a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc" do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      is_upcase = Proc.new { |s| s.upcase == s }
      contains_a = Proc.new { |s| s.downcase.include?('a') }
      make_question = Proc.new { |s| s + '???' }
      reverse = Proc.new { |s| s.reverse }
      add_smile = Proc.new { |s| s + ':)' }

      expect(procipher('he said what!',
                  is_yelled => make_question,
                  contains_a => reverse
        )).to eq("he dias ???!tahw")

      expect(procipher('he said what!',
                  contains_a => reverse,
                  is_yelled => make_question
        )).to eq("he dias !tahw???")

      expect(procipher('he said what!',
                  contains_a => reverse,
                  is_yelled => add_smile
        )).to eq("he dias !tahw:)")

      expect(procipher('stop that taxi now',
                  is_upcase => add_smile,
                  is_yelled => reverse,
                  contains_a => make_question
        )).to eq("stop that??? taxi??? now")

      expect(procipher('STOP that taxi now!',
                  is_upcase => add_smile,
                  is_yelled => reverse,
                  contains_a => make_question
        )).to eq("STOP:) that??? taxi??? !won")
    end
  end

  describe "picky_procipher" do
    it "should accept a sentence and a hash as arguments" do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      contains_a = Proc.new { |s| s.downcase.include?('a') }
      make_question = Proc.new { |s| s + '???' }
      reverse = Proc.new { |s| s.reverse }

      expect { picky_procipher('he said what!', is_yelled => make_question, contains_a => reverse) }.to_not raise_error
    end

    it "should return a new sentence where each word of the input sentence is changed by a value proc if the original word returns true when passed into the key proc." do
      is_yelled = Proc.new { |s| s[-1] == '!' }
      is_upcase = Proc.new { |s| s.upcase == s }
      contains_a = Proc.new { |s| s.downcase.include?('a') }
      make_question = Proc.new { |s| s + '???' }
      reverse = Proc.new { |s| s.reverse }
      add_smile = Proc.new { |s| s + ':)' }

      expect(picky_procipher('he said what!',
                        is_yelled => make_question,
                        contains_a => reverse
        )).to eq("he dias what!???")

      expect(picky_procipher('he said what!',
                        contains_a => reverse,
                        is_yelled => make_question
        )).to eq("he dias !tahw")

      expect(picky_procipher('he said what!',
                        contains_a => reverse,
                        is_yelled => add_smile
        )).to eq("he dias !tahw")

      expect(picky_procipher('stop that taxi now',
                        is_upcase => add_smile,
                        is_yelled => reverse,
                        contains_a => make_question
        )).to eq("stop that??? taxi??? now")

      expect(picky_procipher('STOP that taxi!',
                        is_upcase => add_smile,
                        is_yelled => reverse,
                        contains_a => make_question
        )).to eq("STOP:) that??? !ixat")
    end
  end
end