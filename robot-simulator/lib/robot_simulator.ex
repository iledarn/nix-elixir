defmodule Robot do
  defstruct direction: :north,
            position: {0, 0}
end

defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]
  @valid_instructions "LRA"
  @turns %{
    north: %{"L" => :west, "R" => :east},
    east: %{"L" => :north, "R" => :south},
    south: %{"L" => :east, "R" => :west},
    west: %{"L" => :south, "R" => :north}
  }
  @advances %{
    north: {0, 1},
    east: {1, 0},
    south: {0, -1},
    west: {-1, 0}
  }

  defguard is_position(x, y) when is_integer(x) and is_integer(y)

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when direction not in @valid_directions do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y} = position) when is_position(x, y) do
    %Robot{direction: direction, position: position}
  end

  def create(_direction, _position) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, "") do
    robot
  end

  def simulate(%{direction: dir, position: pos} = robot, instructions) do
    instruction = String.slice(instructions, 0..0)

    if String.contains?(@valid_instructions, instruction) do
      remain_instructions = String.slice(instructions, 1..String.length(instructions))
      new_direction = @turns[dir][instruction]

      new_position =
        {elem(pos, 0) + elem(@advances[dir], 0), elem(pos, 1) + elem(@advances[dir], 1)}

      robot =
        case instruction do
          "L" -> %{robot | direction: new_direction}
          "R" -> %{robot | direction: new_direction}
          "A" -> %{robot | position: new_position}
        end

      simulate(robot, remain_instructions)
    else
      {:error, "invalid instruction"}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: dir}), do: dir

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: pos}), do: pos
end
