defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when (code ||| 0b100000) == 0b100000 do
    []
  end

  def commands(code) when (code &&& 0b10000) == 0b10000 do
    commands(code &&& 0b01111) |> Enum.reverse()
  end

  def commands(code) when (code &&& 0b1) == 0b1 do
    ["wink" | commands(code &&& 0b11110)]
  end

  def commands(code) when (code &&& 0b10) == 0b10 do
    ["double blink" | commands(code &&& 0b11100)]
  end

  def commands(code) when (code &&& 0b100) == 0b100 do
    ["close your eyes" | commands(code &&& 0b11000)]
  end

  def commands(code) when (code &&& 0b1000) == 0b1000 do
    ["jump" | commands(code &&& 0b10000)]
  end

  def commands(0) do
    []
  end
end
