defmodule VirtualMachine.EvaluatorTest do
  use ExUnit.Case
  alias VirtualMachine.Evaluator
  alias VirtualMachine.Register

  setup do
    VirtualMachine.start
    :ok
  end

  test "adding two registers and placing the result into a third register" do
    :ok = Evaluator.load(0, 1)
    :ok = Evaluator.load(1, 2)
    :ok = Evaluator.add(0, 1, 2)
    assert {:ok, 3} = Register.get_register(2)
  end
end
