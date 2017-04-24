defmodule Morphology do
  @moduledoc"""
  This module is responsible for creating sensors and actuators, according to the applicable scape.
  The macro receives the name of the scape, as well as the class of interactor and generates a
  struct accordingly.

  The problem at hand is the simple call to the old Genotype.construct module just takes the
  name of the nn and ought to create acceptable sensors.

  So, you want to give it the xor_mimic parts. The scape and interactor will be derived from something
  akin to sensor = s.name, which will return an atom. So the macro must receive an atom and call
  a corresponding function. This will be doable because the AST in elixir uses atoms....


  There is a sensor created by Morphology.xor_mimic... how to call this automatically.

  We'd like to be able to create the genotype, corresponding phenotype, and train it with one call.
  Train.ffnn(name, scape, hld, generations \\ 100)

  The first step is to create the genotype, which looks like this:

  cortex = %Cortex{id: Generate.id(), n_ids: nil, sensors: nil, actuators: nil, scape: nil, name: nil}
  n_ids = [id1, id2, id3,... idn]
  sensors = [scape_s1, scape_s2, ...]
  actuators = [scape_a1, scape_a2, ...]

  """
  defmacro morphology(morph, interactor) do
  end

  def xor_mimic do
  end

  def rubix_cube do
  end

  def other_scape do
  end
end
