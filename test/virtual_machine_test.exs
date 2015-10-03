defmodule VirtualMachineTest do
  use ExUnit.Case

  setup do
    VirtualMachine.start
    :ok
  end

  test "putting a value into a register" do
    VirtualMachine.put_register(0, 100)
  end

  test "getting a value from a register" do
    VirtualMachine.put_register(0, 100)
    assert {:ok, 100} = VirtualMachine.get_register(0)
  end

  test "getting a register that doesn't exist" do
    assert {:error, "No such register '4'"} = VirtualMachine.get_register(4)
  end

  test "adding two registers and placing the result into a third register" do
    :ok = VirtualMachine.put_register(0, 1)
    :ok = VirtualMachine.put_register(1, 2)
    :ok = VirtualMachine.add(0, 1, 2)
    assert {:ok, 3} = VirtualMachine.get_register(2)
  end
end
