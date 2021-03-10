defmodule Pecora.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pecora.Repo,
      # Start the Telemetry supervisor
      PecoraWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pecora.PubSub},
      # Start the Endpoint (http/https)
      PecoraWeb.Endpoint
      # Start a worker by calling: Pecora.Worker.start_link(arg)
      # {Pecora.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pecora.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PecoraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
