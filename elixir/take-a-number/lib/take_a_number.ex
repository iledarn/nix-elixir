defmodule TakeANumber do
  def loop(state) do
    receive do
      _ -> loop(state)
    end

  end

  def start() do
    spawn(TakeANumber, :loop, [])
  end
end
