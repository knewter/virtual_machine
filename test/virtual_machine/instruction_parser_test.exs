defmodule VirtualMachine.Instruction do
  defstruct name: "", arguments: {0, 0, 0}
end

defmodule VirtualMachine.InstructionParser do
  alias VirtualMachine.Instruction
  @instructions %{
    0 => "halt",
    1 => "add"
  }

  def parse(<<instruction :: size(24),
              arg1        :: size(24),
              arg2        :: size(24),
              arg3        :: size(24)>>) do
    %Instruction{name: instruction_name(instruction), arguments: {arg1, arg2, arg3}}
  end

  def instruction_name(instruction) do
    @instructions[instruction]
  end
end

defmodule VirtualMachine.InstructionParserTest do
  use ExUnit.Case
  alias VirtualMachine.InstructionParser
  alias VirtualMachine.Instruction

  test "instructions can be parsed" do
    parsed = InstructionParser.parse(<<0, 0, 1,   # instruction
                                       0, 0, 1,   # arg1
                                       0, 0, 2,   # arg2
                                       0, 0, 0>>) # arg3
    assert %Instruction{name: "add", arguments: {1, 2, 0}} = parsed
  end
end
