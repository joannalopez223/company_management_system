defmodule Hrsystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HrsystemWeb.Telemetry,
      # Start the Ecto repository
      Hrsystem.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hrsystem.PubSub},
      # Start Finch
      {Finch, name: Hrsystem.Finch},
      # Start the Endpoint (http/https)
      HrsystemWeb.Endpoint
      # Start a worker by calling: Hrsystem.Worker.start_link(arg)
      # {Hrsystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hrsystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HrsystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
