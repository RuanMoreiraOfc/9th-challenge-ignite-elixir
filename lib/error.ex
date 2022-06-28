defmodule Exmeal.Error do
  @keys [:result, :status]
  @enforce_keys @keys
  defstruct @keys
end
