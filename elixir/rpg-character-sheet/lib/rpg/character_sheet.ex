defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> String.trim("\n")
  end

  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> String.trim("\n")
  end

  def ask_level() do
    # Please implement the ask_level/0 function
  end

  def run() do
    # Please implement the run/0 function
  end
end
