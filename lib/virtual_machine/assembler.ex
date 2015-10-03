defmodule VirtualMachine.Assembler do
  alias VirtualMachine.InstructionParser

  def assemble(program) do
    String.split(program, "\n")
    |> Enum.map(&assemble_line(&1))
    |> Enum.reduce(fn(bytes, acc) -> acc <> bytes end)
  end

  def assemble_line(line) do
    parts = String.split(line, " ")
    instruction = Enum.at(parts, 0) |> InstructionParser.instruction_number
    arg1 = Enum.at(parts, 1, "0") |> String.to_integer
    arg2 = Enum.at(parts, 2, "0") |> String.to_integer
    arg3 = Enum.at(parts, 3, "0") |> String.to_integer
    # lol fix this bit
    bytecode = <<0, 0, instruction,
                 0, 0, arg1,
                 0, 0, arg2,
                 0, 0, arg3>>
    {:ok, bytecode}
  end
end
