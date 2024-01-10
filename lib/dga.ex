defmodule OffensiveElixir.DGA do
  @moduledoc """
  This module generates domains salted and hashed in base16 format.

  Each domain is generated using the current datetime and a constant salt.

  Configuration based generation is WIP.
  """

  defp get_random_domain do
    domains = [".com", ".ru", ".org"]

    Enum.random(domains)
  end

  @spec generate_salted_time() :: String
  defp generate_salted_time do
    [DateTime.to_string(DateTime.utc_now()), "4d5b91612216ec8416d0ff039f2f69e8"] |> Enum.join()
  end

  @spec generate_hashed_time() :: String
  defp generate_hashed_time do
    :crypto.hash(:md5, generate_salted_time())
    |> Base.encode16(case: :lower)
  end

  @doc """
  Generates a random domain
  ## Examples

      iex> OffensiveElixir.DGA.generate_domain()
      "dd788981822ea096634bd35122f0ad09.ru"

      iex> OffensiveElixir.DGA.generate_domain()
      "2614da993a1d0d195ae37b99cb473e47.com"      
  """
  @spec generate_domain() :: String
  def generate_domain do
    generate_hashed_time() <> get_random_domain()
  end
end
