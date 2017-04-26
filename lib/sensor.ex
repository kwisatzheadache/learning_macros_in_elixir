defmodule Sensor do
  @moduledoc """
  """
  defstruct id: nil, name: nil, vl: nil, cx_id: nil

  defmacro easy(name) do
    quote do
      {{:., [], [{:__aliases__, [alias: false], [:Sensor]}, unquote(name)]}, [], []}
    end
  end

  def create_easy(name) do
    ast = easy(name)
    Code.eval_quoted(ast)
  end

  def rng do
    IO.puts "rng firing"
  end

  def xor_mimic do
    IO.puts "xor_mimic firing"
  end

  defmacro type(sensor_name) do
    case is_atom(sensor_name) do
      :true -> IO.puts "Sensor.type loaded"
              #> quote do Sensor.create end
              #> {{:., [], [{:__aliases__, [alias: false], [:Sensor]}, :create]}, [], []}
              #  So, we should be able to substitue sensor_name for :create. Should require that sensor_name
              #  be an atom, while we're at it.
              #> quote do IO.puts "hello"
              #> {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [], ["hello"]}
              #  Perhaps I'm looking for Code.eval_quoted(ast_expression)
              ast = {{:., [], [{:__aliases__, [alias: false], [:Sensor]}, sensor_name]}, [], []}
              IO.puts Macro.to_string(ast)
              Code.eval_quoted(ast)
      _ -> "sensor must be an atom"
    end
  end
end
