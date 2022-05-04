defmodule TakeANumber do
  def loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      _ ->
        loop(state)
    end
  end

  def start() do
    spawn(TakeANumber, :loop, [0])
  end
end
