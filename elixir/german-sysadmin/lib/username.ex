defmodule Username do
  def sanitize([]) do
    ''
  end

  def sanitize([head | tail]) do
    elem =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        head when head >= 97 and head <= 122 -> [head]
	head when head == ?_ -> [head]
        _ -> ''
      end

    elem ++ sanitize(tail)
  end
end
