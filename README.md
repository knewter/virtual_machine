## VirtualMachine

This is a register-based Virtual Machine model, written in elixir.  See the
tests for more details, basically :)  But here's an example from one of them:

```elixir
VirtualMachine.start

program = "load 1 2\nload 2 1\nadd 1 2 3"
{:ok, assembled} = Assembler.assemble(program)

assembled
|> InstructionParser.parse
|> VirtualMachine.evaluate

{:ok, 3} = Register.get_register(3)
```
