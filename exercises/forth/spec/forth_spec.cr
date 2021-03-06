require "spec"
require "../src/*"

describe "Forth" do
  it "empty input results in empty stack" do
    Forth.evaluate("").should eq([] of Int32)
  end

  pending "numbers just get pushed onto the stack" do
    Forth.evaluate("1 2 3 4 5").should eq([1, 2, 3, 4, 5])
  end

  pending "all non-word characters are separators" do
    Forth.evaluate("1\u{0}2\u{13}3\n4\r5 6\t7").should eq([1, 2, 3, 4, 5, 6, 7])
  end

  pending "can add two numbers" do
    Forth.evaluate("1 2 +").should eq([3])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("+")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 +")
    end
  end

  pending "can subtract two numbers" do
    Forth.evaluate("3 4 -").should eq([-1])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("-")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 -")
    end
  end

  pending "can multiply two numbers" do
    Forth.evaluate("2 4 *").should eq([8])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("*")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 *")
    end
  end

  pending "can divide two numbers" do
    Forth.evaluate("12 3 /").should eq([4])
  end

  pending "performs integer division" do
    Forth.evaluate("8 3 /").should eq([2])
  end

  pending "errors if dividing by zero" do
    expect_raises do
      Forth.evaluate("4 0 /")
    end
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("/")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 /")
    end
  end

  pending "addition and subtraction" do
    Forth.evaluate("1 2 + 4 -").should eq([-1])
  end

  pending "multiplication and division" do
    Forth.evaluate("2 4 * 3 /").should eq([2])
  end

  pending "copies the top value on the stack" do
    Forth.evaluate("1 DUP").should eq([1, 1])
  end

  pending "is case-insensitive" do
    Forth.evaluate("1 2 Dup").should eq([1, 2, 2])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("dup")
    end
  end

  pending "removes the top value on the stack if it is the only one" do
    Forth.evaluate("1 drop").should eq([] of Int32)
  end

  pending "removes the top value on the stack if it is not the only one" do
    Forth.evaluate("1 2 drop").should eq([1])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("drop")
    end
  end

  pending "swaps the top two values on the stack if they are the only ones" do
    Forth.evaluate("1 2 swap").should eq([2, 1])
  end

  pending "swaps the top two values on the stack if they are not the only ones" do
    Forth.evaluate("1 2 3 swap").should eq([1, 3, 2])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("swap")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 swap")
    end
  end

  pending "copies the second element if there are only two" do
    Forth.evaluate("1 2 over").should eq([1, 2, 1])
  end

  pending "copies the second element if there are more than two" do
    Forth.evaluate("1 2 3 over").should eq([1, 2, 3, 2])
  end

  pending "errors if there is nothing on the stack" do
    expect_raises do
      Forth.evaluate("over")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises do
      Forth.evaluate("1 over")
    end
  end

  pending "can consist of built-in words" do
    Forth.evaluate(": dup-twice dup dup ;1 dup-twice").should eq([1, 1, 1])
  end

  pending "execute in the right order" do
    Forth.evaluate(": countup 1 2 3 ;countup").should eq([1, 2, 3])
  end

  pending "can override other user-defined words" do
    Forth.evaluate(": foo dup ;: foo dup dup ;1 foo").should eq([1, 1, 1])
  end

  pending "can override built-in words" do
    Forth.evaluate(": swap dup ;1 swap").should eq([1, 1])
  end

  pending "can consist of arbitrary characters such as Unicode characters" do
    Forth.evaluate(": € 220371 ; €").should eq([220371])
  end

  pending "cannot redefine numbers" do
    expect_raises do
      Forth.evaluate(": 1 2 ;")
    end
  end

  pending "errors if executing a non-existent word" do
    expect_raises do
      Forth.evaluate("foo")
    end
  end
end
