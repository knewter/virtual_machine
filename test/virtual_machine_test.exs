defmodule VirtualMachineTest do
  use ExUnit.Case
  alias VirtualMachine.Instruction
  alias VirtualMachine.InstructionParser
  alias VirtualMachine.Register
  alias VirtualMachine.Assembler

  setup do
    VirtualMachine.start
    :ok
  end

  test "evaluating an instruction" do
    assert :ok = %Instruction{name: "load", arguments: {1, 1, 0}}
                 |> VirtualMachine.evaluate
    assert {:ok, 1} = Register.get_register(1)
  end

  test "parsing and evaluating an instruction" do
    <<0, 0, 1,  # instruction (load)
      0, 0, 1,  # arg1
      0, 0, 2,  # arg2
      0, 0, 0>> # arg3
    |> InstructionParser.parse
    |> VirtualMachine.evaluate
    assert {:ok, 2} = Register.get_register(1)
  end

  test "evaluating a program" do
    program = "load 1 2"
    {:ok, assembled} = Assembler.assemble(program)

    assembled
    |> InstructionParser.parse
    |> VirtualMachine.evaluate
    assert {:ok, 2} = Register.get_register(1)
  end
end
