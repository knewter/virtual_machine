defmodule VirtualMachine.RegisterTest do
  use ExUnit.Case
  alias VirtualMachine.Register

  setup do
    VirtualMachine.start
    :ok
  end

  test "putting a value into a register" do
    assert :ok = Register.put_register(0, 100)
  end

  test "getting a value from a register" do
    :ok = Register.put_register(0, 100)
    assert {:ok, 100} = Register.get_register(0)
  end

  test "getting a register that doesn't exist" do
    assert {:error, "No such register '4'"} = Register.get_register(4)
  end
end
