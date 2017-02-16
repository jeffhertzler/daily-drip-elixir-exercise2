defmodule Rpn do
  def start do
    Agent.start(fn -> [] end)
  end

  def peek(pid) do
    Agent.get(pid, fn(list) -> list end)
  end

  def push(pid, :+) do
    Agent.update(pid, fn(list) ->
      [second | [first | tail]] = list
      [first + second | tail]
    end)
  end
  def push(pid, :-) do
    Agent.update(pid, fn(list) ->
      [second | [first | tail]] = list
      [first - second | tail]
    end)
  end
  def push(pid, :x) do
    Agent.update(pid, fn(list) ->
      [second | [first | tail]] = list
      [first * second | tail]
    end)
  end
  def push(pid, num) do
    Agent.update(pid, fn(list) -> [num] ++ list end)
  end

end
