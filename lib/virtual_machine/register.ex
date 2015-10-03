defmodule VirtualMachine.Register do
  @registers VirtualMachine.Registers
  @register_size 4
  @register_data Stream.repeatedly(fn -> 0 end)
                 |> Enum.take(@register_size)
                 |> List.to_tuple

  def start_link do
    Agent.start_link(fn -> @register_data end, name: @registers)
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
