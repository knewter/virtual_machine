defmodule VirtualMachine.InstructionParserTest do
  use ExUnit.Case
  alias VirtualMachine.InstructionParser
  alias VirtualMachine.Instruction

  test "instructions can be parsed" do
    parsed = InstructionParser.parse(<<0, 0, 1,    # instruction (load)
                                       0, 0, 1,    # arg1
                                       0, 0, 2,    # arg2
                                       0, 0, 0>>)  # arg3
    assert [%Instruction{name: "load", arguments: {1, 2, 0}}] = parsed
  end
end
