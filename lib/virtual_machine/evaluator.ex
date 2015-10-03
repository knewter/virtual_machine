defmodule VirtualMachine.Evaluator do
  import VirtualMachine.Register, only: [put_register: 2, get_register: 1]

  def add(r1, r2, value_r) do
    {:ok, val1} = get_register(r1)
    {:ok, val2} = get_register(r2)
    val = val1 + val2
    :ok = put_register(value_r, val)
    :ok
  end

  def load(r, val) do
    put_register(r, val)
  end
end
