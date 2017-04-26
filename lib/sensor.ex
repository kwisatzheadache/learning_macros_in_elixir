defmodule Sensor do
  @moduledoc """
  """
  defstruct id: nil, name: nil, vl: nil, cx_id: nil
  require Morphology

  def create(sensor_name) do
    Morphology.type(sensor_name, :sensor)
  end

  #in particular, here is an example of what I need to do with a macro. To pull the Sensor.____
  # function from the loop argument.
  # def loop(id, cx_pid, sensor_name, vl, fanout_pids) do
  #   sensory_vector = case sensor_name do
  #     "rng" -> Sensor.rng(vl)
  #     :xor_mimic -> xor_getinput(vl, nil)
  #     _ -> IO.puts "sensor not supported"
  #   end
  #   receive do
  #     {cx_pid, :sync} ->
  #       IO.puts "sensor received :sync signal line 42"
  #       Send.list(fanout_pids, {self(), :forward, sensory_vector})
  #       loop(id, cx_pid, sensor_name, vl, fanout_pids)
  #     {cx_pid, :terminate} ->
  #       :ok
  #   end
  # end

  # defmacro type_a(name) do
  #   IO.puts "macro loaded"
  #   IO.inspect name, label: "name"
  #   case is_atom(name) do
  #     true -> IO.puts "Sensor.type loaded"
  #             #> quote do Sensor.create end
  #             #> {{:., [], [{:__aliases__, [alias: false], [:Sensor]}, :create]}, [], []}
  #             #  So, we should be able to substitue sensor_name for :create. Should require that sensor_name
  #             #  be an atom, while we're at it.
  #             #> quote do IO.puts "hello"
  #             #> {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [], ["hello"]}
  #             #  Perhaps I'm looking for Code.eval_quoted(ast_expression)
  #             ast = {{:., [], [{:__aliases__, [alias: false], [:Morphology]}, name]}, [], [:sensor]}
  #             # IO.puts Macro.to_string(ast)
  #             ast
  #             # Code.eval_quoted(ast)
  #     false -> IO.puts "sensor must be an atom"
  #       name
  #   end
  # end

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
