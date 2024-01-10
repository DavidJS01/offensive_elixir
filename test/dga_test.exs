defmodule OffensiveElixir.DGATest do
  use ExUnit.Case

  test "assert domains are not equal" do
    domain1 = OffensiveElixir.DGA.generate_domain()
    domain2 = OffensiveElixir.DGA.generate_domain()
    assert domain1 != domain2
  end
end
