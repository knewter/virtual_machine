defmodule VirtualMachine.InstructionParser do
  alias VirtualMachine.Instruction
  @instructions %{
    1 => "load",
    2 => "add"
  }
  @reverse_instructions Map.keys(@instructions)
                        |> Enum.map(fn(key) -> {@instructions[key], key} end)
                        |> Enum.into(%{})

  def parse(bytes) do
    parse(bytes, [])
  end
  def parse(<<instruction :: size(24),
              arg1        :: size(24),
              arg2        :: size(24),
              arg3        :: size(24)>> <> rest, acc) do
    instruction = %Instruction{name: instruction_name(instruction), arguments: {arg1, arg2, arg3}}
    parse(rest, [instruction|acc])
  end
  def parse(<<>>, acc), do: Enum.reverse(acc)

  def instruction_name(instruction) do
    @instructions[instruction]
  end
  def instruction_number(instruction_name) do
    @reverse_instructions[instruction_name]
  end
end
