defmodule VirtualMachine do
  alias VirtualMachine.Register

  def start do
    Register.start_link
  end

  defdelegate [put_register(num, val), get_register(num)], to: Register

  def add(r1, r2, value_r) do
    {:ok, val1} = get_register(r1)
    {:ok, val2} = get_register(r2)
    val = val1 + val2
    :ok = put_register(value_r, val)
    :ok
  end
end
