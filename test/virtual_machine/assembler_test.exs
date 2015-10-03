defmodule VirtualMachine.AssemberTest do
  use ExUnit.Case
  alias VirtualMachine.Assembler

  test "assembling a basic assembly into bytecode" do
    expected_bytecode = <<0, 0, 1,  # instruction (load)
                          0, 0, 1,  # arg1
                          0, 0, 2,  # arg2
                          0, 0, 0>> # arg3
    program = "load 1 2"
    assert {:ok, expected_bytecode} = Assembler.assemble(program)
  end
end
