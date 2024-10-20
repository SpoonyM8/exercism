defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    filtered = filter_by_color(cellar, color)
    year = Keyword.get(opts, :year)
    country = Keyword.get(opts, :country)

    filtered_by_years =
      case year do
        nil -> filtered
        _ -> filter_by_year(filtered, year)
      end

    output =
      case country do
        nil -> filtered_by_years
        _ -> filter_by_country(filtered_by_years, country)
      end

    output
  end

  defp filter_by_color([], _), do: []

  defp filter_by_color(wines, color), do: Keyword.get_values(wines, color)

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
