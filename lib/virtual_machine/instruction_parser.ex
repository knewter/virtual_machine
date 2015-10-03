defmodule VirtualMachine.InstructionParser do
  alias VirtualMachine.Instruction
  @instructions %{
    0 => "halt",
    1 => "load",
    2 => "add"
  }
  @reverse_instructions Map.keys(@instructions)
                        |> Enum.map(fn(key) -> {@instructions[key], key} end)
                        |> Enum.into(%{})

  def parse(<<instruction :: size(24),
              arg1        :: size(24),
              arg2        :: size(24),
              arg3        :: size(24)>>) do
    %Instruction{name: instruction_name(instruction), arguments: {arg1, arg2, arg3}}
  end

  def instruction_name(instruction) do
    @instructions[instruction]
  end

  def instruction_number(instruction_name) do
    @reverse_instructions[instruction_name]
  end
end

