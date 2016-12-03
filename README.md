Plug New Relic
====

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://raw.githubusercontent.com/manheim/amix/master/LICENSE.md)
[![GitHub issues](https://img.shields.io/github/issues/manheim/amix.svg?style=flat-square)](https://github.com/manheim/amix/issues)
[![Hex.pm](https://img.shields.io/hexpm/v/plug_newrelic.svg?maxAge=2592000?style=flat-square)](https://hex.pm/packages/plug_newrelic)

Enable reporting to Newrelic through statman for Plug based web servers

##Setting Up
###Installation

1. Add amix to your `mix.exs` dependencies:

  ```elixir
    def application do
      [
        ...
        applications: [ ... , :plug_newrelic, ...]
        ...
      ]
    end
  ```

    ```elixir
    def deps do
      [
      {:plug_newrelic, "~> 0.0.5"}
      ]
    end
    ```

3. Add Amix.Wrapper before the :match Plug

  ```elixir
    defmodule MyApp do
      import Plug.Conn
      use Application
      use Plug.Router

      plug PlugNewrelic.Wrapper, []
      plug :match
      plug :dispatch
  ```

###Configuration

1. Add Newrelic application to your config.exs file

 ```elixir
 config :newrelic,
   application_name: 'MyApp Name',
   license_key: '1234567890'
 ```

And voila, you should see transactions in you application overview on Newrelic.
The connector also reports responses with code >= 400 as error to Newrelic

####Installation troubleshooting
if you find yourself struggling with lhttpc compilation errors, you should remove non standard characters from this extension Author name.

You can add lhttpc to the applications list in rel/config.exs file:

```elixir
release :your_app do
  set version: current_version(:your_app)
  set vm_args: "rel/vm.args"
  set applications: [
    :runtime_tools,
    :lhttpc
  ]
end
```

If you have problems with jiffy dependence add this to you mix.exs like this:

```elixir
defp deps do
    [
     {:jiffy, "~> 0.14.7", override: true},
```
