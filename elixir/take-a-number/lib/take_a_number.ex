defmodule TakeANumber do
  def start() do
    spawn(TakeANumber, :run, [0])
  end

  def run(state) do
    receive do
      {:report_state, sender_pid} -> send(sender_pid, state); run(state)
      {:take_a_number, sender_pid} -> send(sender_pid, state + 1); run(state + 1)
      :stop -> nil
      _ -> run(state)
    end
  end
end
