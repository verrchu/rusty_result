defmodule Result.MixProject do
  use Mix.Project

  def project, do: [app: :rusty_result, version: "0.1.0", deps: deps()]

  def deps,
    do: [
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
end
