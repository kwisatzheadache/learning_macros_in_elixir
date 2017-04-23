defmodule Sensor do
  @moduledoc """
  """
  defstruct id: nil, name: nil, vl: nil, cx_id: nil

  def create do
    sensor = %Sensor{id: :random.uniform()}
  end
end
