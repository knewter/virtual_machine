defmodule VirtualMachine.Assembler do
  alias VirtualMachine.InstructionParser

  def assemble(program) do
    bytecode = String.split(program, "\n")
               |> Enum.map(&assemble_line(&1))
               |> Enum.reduce(fn(bytes, acc) -> acc <> bytes end)
    {:ok, bytecode}
  end

  def assemble_line(line) do
    tokens = String.split(line, " ")
    instruction = Enum.at(tokens, 0) |> InstructionParser.instruction_number
    arg1 = Enum.at(tokens, 1, "0") |> String.to_integer
    arg2 = Enum.at(tokens, 2, "0") |> String.to_integer
    arg3 = Enum.at(tokens, 3, "0") |> String.to_integer
    <<0, 0, instruction,
      0, 0, arg1,
      0, 0, arg2,
      0, 0, arg3>>
  end
end
