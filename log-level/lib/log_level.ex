defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do
      legacy? == false ->
        case level do
          0 -> :trace
          1 -> :debug
          2 -> :info
          3 -> :warning
          4 -> :error
          5 -> :fatal
          _ -> :unknown
        end
      legacy? == true ->
        case level do
          0 -> :unknown
          1 -> :debug
          2 -> :info
          3 -> :warning
          4 -> :error
          5 -> :unknown
          _ -> :unknown
        end
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      :error -> :ops
      :fatal -> :ops
      :unknown ->
        cond do
          legacy? == true ->
            :dev1
          legacy? == false ->
            :dev2
        end
      _ -> false
    end
  end
end
