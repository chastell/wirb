describe tokenizer(__FILE__) do
  after :each do check_value end

  please do check %w|a ab ab0 ab= < > * + <=> <= >= == =~ __send__ is_a? [] []= |.map(&:to_sym)
    tokens.should == [
      [:open_array, "["],
      [:symbol_prefix, ":"],
      [:symbol, "a"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "ab"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "ab0"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "ab="],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "<"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, ">"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "*"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "+"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "<=>"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "<="],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, ">="],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "=="],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "=~"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "__send__"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "is_a?"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "[]"],
      [:comma, ","],
      [:whitespace, " "],
      [:symbol_prefix, ":"],
      [:symbol, "[]="],
      [:close_array, "]"],
    ]
  end

  please do check :'hello"word'
    tokens.should == [
      [:symbol_prefix, ":"], [:open_symbol_string, "\""],
      [:symbol_string, "hello\\\"word"], [:close_symbol_string, "\""]
    ]
  end

  please do check [[:hallo],{:'hallo'=>:'test'}, {:'hallo='=>:'test='}]
    tokens.should == [
      [:open_array, "["],
      [:open_array, "["],
      [:symbol_prefix, ":"],
      [:symbol, "hallo"],
      [:close_array, "]"],
      [:comma, ","],
      [:whitespace, " "],
      [:open_hash, "{"],
      [:symbol_prefix, ":"],
      [:symbol, "hallo"],
      [:refers, "=>"],
      [:symbol_prefix, ":"],
      [:symbol, "test"],
      [:close_hash, "}"],
      [:comma, ","],
      [:whitespace, " "],
      [:open_hash, "{"],
      [:symbol_prefix, ":"],
      [:symbol, "hallo="],
      [:refers, "=>"],
      [:symbol_prefix, ":"],
      [:symbol, "test="],
      [:close_hash, "}"],
      [:close_array, "]"],
    ]
  end
end
