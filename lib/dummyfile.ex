defmodule Dummy do
  import Morphology

  def sensor_create(sensor_name) do
    type(sensor_name, :sensor)
  end
end
