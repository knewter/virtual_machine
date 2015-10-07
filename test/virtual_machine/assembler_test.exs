defmodule VirtualMachine.AssemblerTest do
  use ExUnit.Case
  alias VirtualMachine.Assembler

  test "assembling a basic assembly into bytecode" do
    expected_bytecode = <<0, 0, 1,
                          0, 0, 1,
                          0, 0, 2,
                          0, 0, 0>>
    program = "load 1 2"
    assert {:ok, expected_bytecode} = Assembler.assemble(program)
  end
end
