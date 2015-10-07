defmodule VirtualMachineTest do
  use ExUnit.Case
  alias VirtualMachine.Instruction
  alias VirtualMachine.Register
  alias VirtualMachine.InstructionParser
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

  test "evaluating an add instruction" do
    assert :ok = %Instruction{name: "load", arguments: {1, 1, 0}}
                 |> VirtualMachine.evaluate
    assert :ok = %Instruction{name: "load", arguments: {2, 2, 0}}
                 |> VirtualMachine.evaluate
    assert :ok = %Instruction{name: "add", arguments: {1, 2, 3}}
                 |> VirtualMachine.evaluate
    assert {:ok, 3} = Register.get_register(3)
  end

  test "parsing and evaluating an instruction" do
    <<0, 0, 1,
      0, 0, 1,
      0, 0, 2,
      0, 0, 0>>
    |> InstructionParser.parse
    |> VirtualMachine.evaluate
    assert {:ok, 2} = Register.get_register(1)
  end

  test "evaluating a program" do
    program = "load 1 2\nload 2 1\nadd 1 2 3"
    {:ok, assembled} = Assembler.assemble(program)

    assembled
    |> InstructionParser.parse
    |> VirtualMachine.evaluate
    assert {:ok, 3} = Register.get_register(3)
  end
end
