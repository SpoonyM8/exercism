defmodule NameBadge do
  def print(id, name, department) do
    base_str = "#{name} - #{get_department(department)}"
    if is_nil(id), do: base_str, else: "[#{id}] - " <> base_str
  end

  defp get_department(department) do
    if is_nil(department), do: "OWNER", else: String.upcase(department)
  end
end
