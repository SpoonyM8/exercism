defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and !legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and !legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    case label do
      :error -> :ops
      :fatal -> :ops
      :unknown when legacy? -> :dev1
      :unknown -> :dev2
      _ -> :false
    end
  end
end
