defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.
  def odd?(n), do: rem(n, 2) == 1

  @spec count(list) :: non_neg_integer
  def count([]) do
    0
  end

  def count([_head | tail]) do
    count(tail) + 1
  end

  @spec reverse(list) :: list
  def reverse([]) do
    []
  end

  def reverse(l) do
    reduce(l, [], &[&1 | &2])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f) do
    []
  end

  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f) do
    []
  end

  def filter(l, f) do
    for elem <- l, f.(elem), do: elem
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f) do
    acc
  end

  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []) do
    []
  end

  def append([], b) do
    b
  end

  def append(a, []) do
    a
  end

  def append(a, b) do
    a = reverse(a)
    reduce(a, b, &[&1 | &2])
  end

  @spec concat([[any]]) :: [any]
  def concat([]) do
    []
  end

  def concat([head | tail]) do
    append(head, concat(tail))
  end
end
