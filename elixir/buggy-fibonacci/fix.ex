defmodule Fib do
  use GenServer

  def init(_args), do: {:ok, %{0 => 0, 1 => 1}}

  def handle_call(:get, _from, state), do: {:reply, state, state}

  def handle_call({:get, number}, _from, state), do: {:reply, state[number], state}

  def handle_cast({:compute, number}, state) do
    last = Map.keys(state) |> Enum.max()
    new_state =
      (last + 1)..number
      |> Enum.reduce(state, fn i, intermediate ->
        Map.put(intermediate, i, intermediate[i - 1] + intermediate[i - 2])
      end)
    {:noreply, new_state}
  end
end
