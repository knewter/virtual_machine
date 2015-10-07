defmodule VirtualMachine.Register do
  @registers VirtualMachine.Registers

  def start_link do
    Agent.start_link(fn -> {0, 0, 0, 0} end, name: @registers)
  end

  def put_register(num, val) do
    Agent.update(@registers, &put_elem(&1, num, val))
  end

  def get_register(num) do
    case Agent.get(@registers, &tuple_size(&1)) do
      size when num < size ->
        {:ok, Agent.get(@registers, &elem(&1, num))}
      _ ->
        {:error, "No such register '#{num}'"}
    end
  end
end
