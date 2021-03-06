defmodule Melib.Config do

  @fonts Application.get_env(:melib, :fonts, %{})

  def get_font(path) when is_binary(path), do: Path.expand(path)

  def get_font(nil), do: get_font(:default)

  def get_font(name) when is_atom(name) do
    if font = @fonts |> Map.get(name) do
      font |> to_string |> get_font
    else
      :code.priv_dir(:melib)
      |> Path.join("/font/JDJSTE.TTF")
      |> Path.expand()
    end
  end

end
