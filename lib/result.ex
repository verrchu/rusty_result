defmodule Result do
  @type result(val, err) :: {:ok, val} | {:error, err}

  @type any_result() :: result(any(), any())
  @type val() :: any()
  @type err() :: any()

  @spec map(any_result(), (val() -> any())) :: any_result()
  def map({:ok, val}, f), do: {:ok, f.(val)}
  def map({:error, _} = err, _f), do: err

  @spec map_err(any_result(), (err() -> any())) :: any_result()
  def map_err({:ok, _} = val, _f), do: val
  def map_err({:error, err}, f), do: {:error, f.(err)}

  @spec and_then(any_result(), (val() -> any_result())) :: any_result()
  def and_then({:ok, val}, f), do: f.(val)
  def and_then({:error, err}, _f), do: err

  @spec inspect_err(any_result(), (err() -> any())) :: any_result()
  def inspect_err({:ok, _} = val, _f), do: val
  def inspect_err({:error, err}, f) do
    f.(err)
    {:error, err}
  end
end
