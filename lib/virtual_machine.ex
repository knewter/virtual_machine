defmodule VirtualMachine do
  alias VirtualMachine.Instruction
  alias VirtualMachine.Evaluator
  alias VirtualMachine.Register

  def start do
    Register.start_link
  end

  def evaluate(%Instruction{name: "load", arguments: {r, val, _}}) do
    Evaluator.load(r, val)
  end
  def evaluate(%Instruction{name: "add", arguments: {r1, r2, output_r}}) do
    Evaluator.add(r1, r2, output_r)
  end

  defdelegate [add(r1, r2, output_register), load(r, val)], to: Evaluator
end
