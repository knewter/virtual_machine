defmodule VirtualMachine do
  alias VirtualMachine.Evaluator
  alias VirtualMachine.Instruction

  def start do
    VirtualMachine.Register.start_link
  end

  def evaluate(instructions) when is_list(instructions) do
    Enum.map(instructions, &evaluate/1)
  end
  def evaluate(%Instruction{name: "load", arguments: {r, val, _}}) do
    Evaluator.load(r, val)
  end
  def evaluate(%Instruction{name: "add", arguments: {r1, r2, output_r}}) do
    Evaluator.add(r1, r2, output_r)
  end
end
